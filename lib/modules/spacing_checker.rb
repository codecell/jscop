require_relative '../error'

module SpacingChecker
  def self.lint_files(err, file)
    space_check_err = check_spaces(file)
    err << space_check_err if space_check_err
    err
  end

  def self.raise_err(line, message)
    error = Error.new(line, message)
    spacing_err = error.print_err(line, message) if error
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
    file.lines.each { |line| lines_with_spaces << line.number if found_spaces(line.content) }
    size = lines_with_spaces.count

    raise_err(lines_with_spaces.to_s, 'SpacingError: Redundant Space(s) found') if size.positive?
  end
end
