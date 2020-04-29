require_relative '../classes/error'

module ClassName
  def self.check_class_name_res(error_bin, path)
    bad_class_lines = check_class_name(path)
    bad_class_lines.each { |line| error_bin << line if !bad_class_lines.empty? }

    error_bin
  end

  private_class_method def self.raise_err(line, message, path)
    error = Error.new(line, message, path)
    naming_err = error.print_err(line, message, path) if error
    naming_err
  end

  def self.bad_class_name(crime)
    fes_pat = /[\s]*(class)[\s]*[\d]*[\-]*[a-z]+[\-]*[\w\W]*/
    sec_pat = /[\s]*(class)[\s]*[\p{Alpha}]+[\-]+[\p{Alpha}]+/

    commented_line = crime.match?(%r{^\W+[\/\/]})

    !commented_line && (fes_pat.match?(crime) || sec_pat.match?(crime))
  end

  def self.check_class_name(file)
    bad_class_named_lines = []
    line_check = lambda { |line|
      bad_class_named_lines << line.number if bad_class_name(line.content)
    }
    file.lines.each(&line_check)

    err_type = 'CLASS_NAME_ERR'
    bad_class_named_lines.each { |line| raise_err(line, err_type, file.filename) }

    bad_class_named_lines
  end
end
