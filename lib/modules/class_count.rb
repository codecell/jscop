require_relative '../error'

module ClassCount
  def self.lint_files(err, file)
    result = check_class_number(file)
    err << result if result
    err
  end

  def self.raise_err(line, message)
    error = Error.new(line, message)
    class_count_err = error.print_err(line, message) if error
    class_count_err
  end

  def self.check_class_number(file)
    pat = /(class)/

    lines_with_class = []
    file.lines.each { |l| lines_with_class << l.number if pat.match?(l.content) }
    size = lines_with_class.count

    raise_err(lines_with_class, "CountError: #{lines_with_class.count} classes defined in a module") if size > 1
  end
end
