require_relative '../error'

module SpacingChecker
  def self.lint_files(err, file)
    space_check = check_spaces(file)
    err << space_check if space_check
    err
  end

  def self.raise_err(line, message)
    error = Error.new(line, message)
    spacing_err = error.print_space_err(line, message) if error
    spacing_err
  end

  def self.check_spaces(file)
    state = false

    def self.found_spaces(cont)
      spaces_before = /[\s]+(const|let|var|function|class)[\s]+[\w]*/
      spaces_after = /[\s]*(const|let|var|function|class)[\s]{2,}/
      spaced_console = /[\s]+(function|(console.log)[\(][\w]*[\)])[\s]*/

      spaces_before.match?(cont) || spaces_after.match?(cont) || spaced_console.match?(cont)
    end
    lines_with_spaces = []
    file.lines.each {|l| lines_with_spaces << l.number if found_spaces(l.content)}
    size = lines_with_spaces.count

    state = raise_err(lines_with_spaces, "SpacingError: Redundant Space(s) found") if size > 0
  end
end