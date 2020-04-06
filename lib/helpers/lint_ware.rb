require_relative '../modules/check_js_files'
require_relative '../js_parser'
require_relative '../modules/spacing_checker'
require_relative '../modules/naming_checker'
require_relative '../modules/class_count'
require_relative '../error'

module LintWare
  def self.call_all(err, _line)
    err
  end

  def self.linter(given_file, errors)
    file = JsParser.new(given_file)

    CheckJsFiles.lint_files(errors, file)
    SpacingChecker.lint_files(errors, file)
    NamingChecker.lint_files(errors, file)
    ClassCount.lint_files(errors, file)

    file.lines.each { |line| errors = call_all(errors, line) if errors }
  end

  def self.init_files_linting(path, errors)
    if CheckJsFiles.find_file(path)
      linter(path, errors)
    else
      puts "No such File as #{path}"
    end
  end

  def self.init_dir_linting(path, errors)
    if CheckJsFiles.find_dir(path)
      files = CheckJsFiles.seek_js(path)
      if !files.is_a? String
        files.each { |file| linter(file, errors) }
      else
        puts "No such Folder as #{path}"
      end
    else
      p CheckJsFiles.find_dir(path)
    end
  end
end
