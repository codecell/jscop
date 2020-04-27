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
    spaces_before = /[\s]+(const|let|var|function|class|[\}$])[\s]+[\w]*/
    spaces_after = /(const|let|var|function|class)[\s]{2,}[\w]+[\s]*[\=]/
    spaced_console = /[\s]+(function|(console.log)[\(][\w]*[\)])[\s]*/
    closing_line = /[\s]+[\}][\s]*/

    a = spaces_before.match?(cont)
    b = spaces_after.match?(cont)
    c = spaced_console.match?(cont)

    a || b || c || closing_line.match?(cont)
  end

  def self.check_spaces(file)
    lines_with_spaces = []
    check_line = lambda { |line|
      lines_with_spaces << line.number if found_spaces(line.content) && !lines_with_spaces.nil?
    }
    err_type = 'SPACING_ERR'
    file.lines.each(&check_line)

    lines_with_spaces.each { |line| raise_err(line, err_type, file.filename) if !lines_with_spaces.empty? }
  end
end
