class Error
  attr_accessor :line, :err_type, :file_path, :variable

  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(line, err_type, fpath, *variable)
    @line = line
    @err_type = err_type
    @file_path = fpath
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def print_err(line, type, path, *variable)
    error_hash = {
      'VAR_NAMING_ERR': 'VariableName Error: Uppercase|Numbers used to Start a Variable name.',
      'CLASS_NAME_ERR': 'ClassName Error: Ensure classes Begin With Uppercase and is not Snake-Cased.',
      'SPACING_ERR': 'Spacing Error: Redundant Space(s).',
      'CLASS_COUNT_ERR': 'Count Error: Multiple Classes Defined in a Module.',
      'UNUSED_VAR_ERR': "Warning: Unused Variable ** #{variable[0]} ** Detected."
    }

    emit_err = lambda { |key|
      if type == 'UNUSED_VAR_ERR' && key[0].to_s == type
        puts "#{key[1].to_s.yellow} On Line #{line.to_s.yellow} in #{path.to_s.yellow}" if line
        puts
      elsif type != 'UNUSED_VAR_ERR' && key[0].to_s == type
        puts "#{key[1].to_s.red} Detected On Line #{line.to_s.yellow} in #{path.to_s.yellow}"
        puts
      end
    }

    error_hash.each(&emit_err)
  end
end
