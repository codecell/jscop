require_relative '../error'

module ClassName
  def self.lint_files(err, file)
    name_check_err = check_class_name(file)
    err << name_check_err if name_check_err
    err
  end

  def self.raise_err(line, message)
    error = Error.new(line, message)
    naming_err = error.print_err(line, message) if error
    naming_err
  end

  def self.bad_class_name(crime)
    pattern = /[\s]*(class)[\s]*[\s]*[[A-Z][\-]]+[a-zA-Z]+[\-]+[\w\W]*/
    pattern.match?(crime)
  end

  def self.check_class_name(file)
    bad_class_named_lines = []
    file.lines.each { |line| bad_class_named_lines << line.number if bad_class_name(line.content) }
    size = bad_class_named_lines.length

    message = 'NamingError: Ensure classes begin with Uppercase and is not snake Cased'
    raise_err(bad_class_named_lines, message) if size.positive?
  end
end
