require_relative '../error'

module NamingChecker
  def self.check_naming_res(error_bin, path)
    bad_named_lines = check_naming(path)
    bad_named_lines.each { |line| error_bin << line if bad_named_lines }

    error_bin
  end

  private_class_method def self.raise_err(line, err_type, path_name)
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
    bad_lines = []
    check_line = lambda { |line|
      line_with_bad_naming = line if bad_var_case(line.content)
      bad_lines << line_with_bad_naming.number if line_with_bad_naming
    }
    err_type = 'VAR_NAMING_ERR'
    fpath.lines.each(&check_line)

    bad_lines.each { |line| raise_err(line, err_type, fpath.filename) if !bad_lines.empty? }
  end
end
