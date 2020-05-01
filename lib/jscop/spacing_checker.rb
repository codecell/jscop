require_relative '../classes/error'

module SpacingChecker
  def self.check_spaces_res(error_bin, path)
    bad_spaced_lines = check_spaces(path)
    bad_spaced_lines.each { |line| error_bin << line if !bad_spaced_lines.empty? }

    error_bin
  end

  private_class_method def self.raise_err(line, message, path)
    error = Error.new(line, message, path)
    spacing_err = error.print_err(line, message, path) if error
    spacing_err
  end

  def self.found_spaces(cont)
    /(?<lhs>\w+[\W]*)\s{2,}(?<rhs>\w+[\W]*)/ =~ cont
    vsf = !Regexp.last_match.nil?

    /(?<lhs>\w+\W*)\s{2,}=\s*(?<rhs>\w+\W*)/ =~ cont
    beq = !Regexp.last_match.nil?

    /(?<lhs>\w+\W*)\s*=\s{2,}(?<rhs>\w+\W*)/ =~ cont
    aeq = !Regexp.last_match.nil?

    spaced_console = /(console.log)[\s+][\(][\w\W]+[\)]/
    spc = spaced_console.match?(cont)
    commented_line = cont.match?(%r{^\W+[\/\/]})

    !commented_line && (vsf || beq || aeq || spc)
  end

  def self.spc_around_fn(cont)
    around_funcs = /[\)][\s]{2,}[\{]/.match?(cont)
    around_classes = /[\w+\-*]*[\s]{2,}[\{]/.match?(cont)

    commented_line = cont.match?(%r{^\W+[\/\/]})

    !commented_line && (around_funcs || around_classes)
  end

  def self.closing_curly_spacing(cont)
    spaced_closing_curly = /[\s]+[\}][\s]*/
    c = spaced_closing_curly.match(cont)

    commented_line = cont.match?(%r{^\W+[\/\/]})

    c && !commented_line
  end

  def self.closed_curly(cont)
    cont.match?(/}/)
  end

  def self.open_curly(cont)
    cont.match?(/{/)
  end

  def self.line_beginining_spaces(line)
    /^[\s+][\w\W]*/.match?(line)
  end

  def self.check_spaces(file)
    seen_open = false
    counter = 0
    lines_with_spaces = []

    opening_tracker = 0
    closing_tracker = 0

    arr = file.lines
    err_type = 'SPACING_ERR'

    while counter < arr.length
      line = arr[counter]

      seen_open = true if open_curly(line.content)

      opening_tracker += 1 if line.content.match?(/{/)
      closing_tracker += 1 if line.content.match?(/}/) && !line.content.match?(/[\}][\s]*[\)]/)

      lines_with_spaces << line.number if line_beginining_spaces(line.content) unless seen_open
      opt = (opening_tracker == closing_tracker)
      seen_open = false if closed_curly(line.content) && opt

      lines_with_spaces << line.number if closing_curly_spacing(line.content) && opt
      lines_with_spaces << line.number if found_spaces(line.content) && !lines_with_spaces.nil?
      lines_with_spaces << line.number if spc_around_fn(line.content)

      counter += 1
    end

    lines_with_spaces.each { |line| raise_err(line, err_type, file.filename) if !lines_with_spaces.empty? }
  end
end
