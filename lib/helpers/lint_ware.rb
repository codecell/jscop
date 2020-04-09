require_relative '../modules/check_js_files'
require_relative '../modules/spacing_checker'
require_relative '../modules/naming_checker'
require_relative '../modules/class_count'
require_relative '../modules/class_name'
require_relative '../modules/unused_var_checker'

require_relative '../js_parser'

module LintWare
  private

  def self.start_all(given_file)
    file = JsParser.new(given_file)

    SpacingChecker.check_spaces(file)
    NamingChecker.check_naming(file)
    ClassCount.check_class_number(file)
    ClassName.check_class_name(file)
    UnusedVarChecker.check_unused_var(file)
  end

  def self.init_files_linting(path)
    if CheckJsFiles.find_file(path)
      start_all(path)
    else
      puts "No such File as #{path}".yellow
    end
  end

  def self.init_dir_linting(path)
    if CheckJsFiles.find_dir(path)
      files = CheckJsFiles.seek_js(path)
      if files
        files.each { |file| start_all(file) }
      else
        puts "No such Folder as #{path}".yellow
      end
    else
      CheckJsFiles.find_file(path)
    end
  end
end
