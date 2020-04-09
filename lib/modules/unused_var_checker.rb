require_relative '../error'

module UnusedVarChecker
  def self.raise_err(line, message, path, variable)
    error = Error.new(line, message, path, variable)
    unused_var_err = error.print_err(line, message, path, variable) if error
    unused_var_err
  end

  # /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "  x = y  " <= From: https://ruby-doc.org/core-2.6.4/Regexp.html

  # rubocop:disable Lint/UselessAssignment
  def self.match_variable(contents)
    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ contents

    lhs
  end
  # rubocop:enable Lint/UselessAssignment

  def self.create_variables_check_message(count_vs_var, lines_vs_var, filename)
    err_type = 'UNUSED_VAR_ERR'

    send_res = count_vs_var.each { |var_a, counter|
      lines_vs_var.each { |line, var_b|
        raise_err(line, err_type, filename, var_b) if counter == 1 && var_a == var_b
      }
    }

    send_res
  end

  def self.check_unused_var(file)
    variable_instances = []
    var_instances_count_hash = {}
    lines_variables_hash = {}

    line_check = lambda { |line|
      detected_variable = match_variable(line.content.to_s)
      lines_variables_hash[line.number] = detected_variable if detected_variable
      variable_instances << detected_variable if detected_variable
    }

    file.lines.each(&line_check)
    variable_instances.map { |el|
      var_instances_count_hash[el] = var_instances_count_hash[el] ? var_instances_count_hash[el] += 1 : 1
    }

    create_variables_check_message(var_instances_count_hash, lines_variables_hash, file.filename)
  end
end
