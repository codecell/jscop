class Error
  attr_accessor :line, :err_type, :file_path

  def initialize(line, err_type, fpath)
    @line = line
    @err_type = err_type
    @file_path = fpath
  end

  def print_linter_result(error_bin)
    error_bin = []
    
    number_of_errors = error_bin.length
  
    puts "As Clean As Snow! No Errors Found in #{path}".green unless number_of_errors.positive?  
  
    puts "#{number_of_errors} Error(s) Found! in #{path}".yellow if number_of_errors.positive?
    puts
  end

  def print_err(line, type, path)
    error_hash = {
      'VAR_NAMING_ERR': 'VariableName Error: Uppercase|Numbers used to Start a variable name',
      'CLASS_NAME_ERR': 'ClassName Error: Ensure classes begin with Uppercase and is not snake Cased',
      'SPACING_ERR': 'Spacing Error: Redundant Space(s) Found',
      'CLASS_COUNT_ERR': 'Count Error: Multiple classes defined in a module'
    }

    emit_err = error_hash.each {|key|
      puts "#{key[1].to_s.red}. Found On >> line #{line.to_s.yellow} << in #{path.to_s.yellow}" if key[0].to_s == type
    }
   
    # if emit_err
    # else
    #   puts "Ite a di Ocha"
    # end
    emit_err
  end
end
