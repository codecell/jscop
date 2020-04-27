require_relative '../classes/error'

module UnusedVarChecker
  def self.check_unused_var_res(error_bin, path)
    unused_var = check_unused_var(path)
    unused_var.each { |line, _variabl| error_bin << line if !unused_var.empty? }

    error_bin
  end

  private_class_method def self.raise_err(line, message, path, variable)
    error = Error.new(line, message, path, variable)
    unused_var_err = error.print_err(line, message, path, variable) if error
    unused_var_err
  end

  def self.extract_from_parentesis(expresn)
    /([\(][\w\W]+[\)])/ =~ expresn
    vars_match_data = Regexp.last_match

    vars_match_data_str_arr = vars_match_data.to_s.split

    vars_match_data_str_arr.collect { |var|
      /([\w\-]+)/ =~ var
      wanted = Regexp.last_match
      wanted = wanted.to_s

      all_params << wanted.to_s if !wanted.empty?
    }
  end
  # /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "  x = y  " <= From: https://ruby-doc.org/core-2.6.4/Regexp.html

  # rubocop:disable Lint/UselessAssignment
  def self.match_variable(contents)
    /(?<lhs>\w+)\s*=\s*(?<rhs>\w*\W*)/ =~ contents

    lhs
  end
  # rubocop:enable Lint/UselessAssignment

  def self.create_variables_check_info(count_vs_var, lines_vs_var, filename)
    err_type = 'UNUSED_VAR_ERR'

    lines_with_unused_var = []

    count_vs_var.each { |var_a, counter|
      lines_vs_var.each { |line, var_b|
        lines_with_unused_var << line if counter == 1 && var_a == var_b
        raise_err(line, err_type, filename, var_b) if counter == 1 && var_a == var_b
      }
    }

    lines_with_unused_var
  end

  def self.check_unused_var(file)
    variable_instances = []
    var_instances_count_hash = {}
    lines_variables_hash = {}

    line_check = lambda { |line|
      /([\(][\w\W]+[\)])/ =~ line.content.to_s
      vars_match_data = Regexp.last_match

      vars_match_data = vars_match_data if !vars_match_data.nil?
      vars_match_data_str_arr = vars_match_data.to_s.split

      escapables = ['var', 'let', '', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

      vars_match_data_str_arr.collect { |var|
        /([\w\-]+)/ =~ var
        wanted = Regexp.last_match
        wanted = wanted.to_s
        lines_variables_hash[line.number] = wanted if wanted
        variable_instances << wanted if !escapables.include?(wanted)
      }

      commented_line = line.content.to_s.match?(%r{^\W+[\/\/]})

      detected_variable = match_variable(line.content.to_s) if !commented_line
      lines_variables_hash[line.number] = detected_variable if detected_variable
      variable_instances << detected_variable if detected_variable
    }

    file.lines.each(&line_check)

    variable_instances.map { |el|
      var_instances_count_hash[el] = var_instances_count_hash[el] ? var_instances_count_hash[el] += 1 : 1
    }

    create_variables_check_info(var_instances_count_hash, lines_variables_hash, file.filename)
  end
end
