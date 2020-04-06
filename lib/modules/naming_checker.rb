require_relative '../error'

module NamingChecker
  def self.lint_files(err, file)
    name_check_err = check_naming(file)
    err << name_check_err if name_check_err
    err
  end

  def self.raise_err(line, message)
    error = Error.new(line, message)
    naming_err = error.print_err(line, message) if error
    naming_err
  end

  def self.bad_var_case(bad_case)
    bad_var_start = /(var|let|const|[\s])[\s]*([[:upper:]]{1,}|\d)+(([\w]+[\s][\w]+)|[\w]+)[\s]*[\=][\s]*[\w]*/
    good_var_with_space_in_between = /^[(var|let|const|[\s])][\s]+[\w]+[\s]{1,}[\w]+[\s]+[\=][\s]+\w+/
    bad_var_start.match?(bad_case) || good_var_with_space_in_between.match?(bad_case)
  end

  def self.check_naming(file)
    lines_with_spaces = []

    file.lines.each { |ln| lines_with_spaces << ln.number if bad_var_case(ln.content) }
    size = lines_with_spaces.length

    error_message = 'NamingError: Uppercase|Numbers used to Start a variable name'
    raise_err(lines_with_spaces, error_message) if size.positive?
  end
end
