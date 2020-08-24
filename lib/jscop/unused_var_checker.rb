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

  def self.check_escapable(elem)
    escapables = [
      '', 'var', 'let', 'const', 'constructor', 'class', 'super', 'function', 'static', 'console',
      'prototype', 'get', 'set', 'this', 'alert', 'prompt', 'return',
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
    ]

    escapables.include?(elem)
  end

  def self.vars_parentesis(paramz)
    /(?<lhs>[\(])(?<rhs>[^\{]*[\w\-]+)/ =~ paramz
    vars = Regexp.last_match(:rhs)
    vars = vars.to_s.split if vars
    vars_match_data = vars.to_s.split

    each_var = vars_match_data.collect { |var|
      /([\w\-]+)/ =~ var
      wanted = Regexp.last_match(0)
      wanted = wanted.to_s
      wanted
    }
    each_var[0] if each_var[0] && !each_var.nil?
  end

  def self.match_accessd_var(vari)
    /(?<lhs>[\w+\-*]+)[\[](?<rhs>[\w+\-*]+)/ =~ vari
    sqad = Regexp.last_match(:rhs)

    /(?<lhs>[\w+\-*]+)\.(?<rhs>[\w+\-*]+)/ =~ vari
    awda = Regexp.last_match(:rhs)

    sqad || awda
  end

  def self.match_variable(contents)
    /(?<lhs>\w+)\s*=\s*(?<rhs>\w*\W*)/ =~ contents
    equals_var = Regexp.last_match(:lhs)

    /(?<lhs>(let|var|const))\s{1,}(?<rhs>[\w\-]*)/ =~ contents
    lazy_init_var = Regexp.last_match(:rhs)

    /(?<lhs>\w+)\s*(?<rhs>[\(\w+\)]*)/ =~ contents
    func_call_var = Regexp.last_match(:lhs)

    lazy_init_var || func_call_var || equals_var
  end

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
      commented_line = line.content.to_s.match?(%r{^\W+[\/\/]})

      from_parentsis = vars_parentesis(line.content.to_s) if !commented_line
      lines_variables_hash[line.number] = from_parentsis if from_parentsis
      variable_instances << from_parentsis if !check_escapable(from_parentsis) && !from_parentsis.nil?

      detected_var = match_variable(line.content.to_s) if !commented_line
      detected_accessd_var = match_accessd_var(line.content.to_s) if !commented_line

      lines_variables_hash[line.number] = detected_var if detected_var
      lines_variables_hash[line.number] = detected_accessd_var if detected_accessd_var

      variable_instances << detected_var if !check_escapable(detected_var) && !detected_var.nil?
      variable_instances << detected_accessd_var if !check_escapable(detected_accessd_var) && !detected_accessd_var.nil?
    }

    file.lines.each(&line_check)
    variable_instances.map { |el|
      var_instances_count_hash[el] = var_instances_count_hash[el] ? var_instances_count_hash[el] += 1 : 1
    }

    create_variables_check_info(var_instances_count_hash, lines_variables_hash, file.filename)
  end
end
