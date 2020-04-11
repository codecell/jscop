require_relative '../error'

module ClassCount
  def self.class_count_res(error_bin, path)
    lines_with_class_def = class_count(path)
    error_bin << lines_with_class_def if !lines_with_class_def.empty?

    error_bin
  end

  private_class_method def self.raise_err(line, message, path)
    error = Error.new(line, message, path)
    class_count_err = error.print_err(line, message, path) if error
    class_count_err
  end

  def self.class_count(file)
    pat = /(class)/

    lines_with_class = []
    err_type = 'CLASS_COUNT_ERR'

    file.lines.each { |line| lines_with_class << line.number if pat.match?(line.content) }
    raise_err(lines_with_class, err_type, file.filename) if lines_with_class.length > 1

    lines_with_class
  end
end
