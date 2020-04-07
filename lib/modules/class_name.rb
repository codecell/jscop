require_relative '../error'

module ClassName
  def self.raise_err(line, message, path)
    error = Error.new(line, message, path)
    naming_err = error.print_err(line, message, path) if error
    naming_err
  end

  def self.bad_class_name(crime)
    fes_pat = /[\s]*(class)[\s]*[\d]*[\-]*[a-z]+[\-]*[\w\W]*/
    sec_pat = /[\s]*(class)[\s]*[\p{Alpha}]+[\-]+[\p{Alpha}]+/
    fes_pat.match?(crime) || sec_pat.match?(crime)
  end

  def self.check_class_name(file)
    line_check = lambda { |line|
      bad_class_named_lines = line.number if bad_class_name(line.content)
      err_type = 'CLASS_NAME_ERR' if bad_class_named_lines
      raise_err(bad_class_named_lines, err_type, line.filename)
    }

    file.lines.each(&line_check)
  end
end
