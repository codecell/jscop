require_relative '../error'

module SpacingChecker
  def self.lint_files(file)
    check_spaces(file)
  end

  def self.raise_err(line, message, path)
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
    file.lines.each { |line|
      lines_with_spaces = line.number if found_spaces(line.content)
      err_type = 'SPACING_ERR' if lines_with_spaces
      raise_err(lines_with_spaces, err_type, line.filename)
    }
  end
end
