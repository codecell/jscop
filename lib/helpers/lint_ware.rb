require_relative '../modules/check_js_files'
require_relative '../js_parser'
# require_relative '../modules/variable_checker'
require_relative '../error'

module LintWare 
  def self.call_all(err, line)
    err
  end
  
  def self.linter(given_file, errs)
    file = JsParser.new(given_file)
    # CheckJsFiles.lint_files(errs, file)
    # VariableChecker.lint_files(errs, file)
    read_lambda = lambda {|l| errs = call_all(errs, l) if errs}
    file.lines.each(&read_lambda)
  end

  def self.init_files_linting(path, errs)
    if CheckJsFiles.find_file(path)
      linter(path, errs)
    else
      puts "No such File as #{path}"
    end
  end

  def self.init_dir_linting(path, errs)
    if CheckJsFiles.find_dir(path)
      files = CheckJsFiles.seek_js(path)
      if !files.is_a? String
        files.each {|f| linter(f, errs)}
      else
        puts "No such Folder as #{path}"
      end
    else
      p CheckJsFiles.find_dir(path)
    end
  end
end
