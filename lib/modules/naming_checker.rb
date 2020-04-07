require_relative '../error'

module NamingChecker
  def self.raise_err(line, err_type, path_name)
    error = Error.new(line, err_type, path_name)
    naming_err = error.print_err(line, err_type, path_name) if error
    naming_err
  end

  def self.bad_var_case(bad_case)
    bad_var_start = /(var|let|const|[\s])[\s]*([[:upper:]]{1,}|\d)+(([\w]+[\s][\w]+)|[\w]+)[\s]*[\=][\s]*[\w]*/
    good_var_with_space_in_between = /^[(var|let|const|[\s])][\s]+[\w]+[\s]{1,}[\w]+[\s]+[\=][\s]+\w+/
    bad_var_start.match?(bad_case) || good_var_with_space_in_between.match?(bad_case)
  end

  def self.check_naming(fpath)
    check_line = lambda { |line|
      line_with_bad_naming = line.number if bad_var_case(line.content)
      err_type = 'VAR_NAMING_ERR' if line_with_bad_naming
      raise_err(line_with_bad_naming, err_type, line.filename) if line_with_bad_naming
    }

    fpath.lines.each(&check_line)
  end
end
