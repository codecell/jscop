require_relative '../error'

module ClassCount
  def self.raise_err(line, message, path)
    error = Error.new(line, message, path)
    class_count_err = error.print_err(line, message, path) if error
    class_count_err
  end

  def self.check_class_number(file)
    pat = /(class)/

    lines_with_class = []
    err_type = 'CLASS_COUNT_ERR'

    file.lines.each { |line| 
      lines_with_class << line.number if pat.match?(line.content)
      name = line.filename
    }
    raise_err(lines_with_class, err_type, file.filename) if lines_with_class.length > 1
  end
end
