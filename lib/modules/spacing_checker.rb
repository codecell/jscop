require_relative '../error'

module SpacingChecker
  def self.lint_files(err, file)
    space_check_err = check_spaces(file)
    err << space_check_err if space_check_err
    err
  end

  def self.raise_err(line, message)
    error = Error.new(line, message)
    spacing_err = error.print_space_err(line, message) if error
    spacing_err
  end

  def self.found_spaces(cont)
    spaces_before = /[\s]+(const|let|var|function|class)[\s]+[\w]*/
    spaces_after = /[\s]*(const|let|var|function|class)[\s]{2,}/
    spaced_console = /[\s]+(function|(console.log)[\(][\w]*[\)])[\s]*/

    spaces_before.match?(cont) || spaces_after.match?(cont) || spaced_console.match?(cont)
  end

  def self.check_spaces(file)
    lines_with_spaces = []
    file.lines.each { |line| lines_with_spaces << line.number if found_spaces(line.content) }
    size = lines_with_spaces.count

    raise_err(lines_with_spaces, 'SpacingError: Redundant Space(s) found') if size.positive?
  end
end
