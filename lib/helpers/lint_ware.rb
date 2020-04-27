require_relative '../jscop/check_js_files'
require_relative '../jscop/spacing_checker'
require_relative '../jscop/naming_checker'
require_relative '../jscop/class_count'
require_relative '../jscop/class_name'
require_relative '../jscop/unused_var_checker'

require_relative '../classes/js_parser'

module LintWare
  private_class_method def self.start_all(error_bin, given_file)
    file = JsParser.new(given_file)

    NamingChecker.check_naming_res(error_bin, file)
    SpacingChecker.check_spaces_res(error_bin, file)
    ClassCount.class_count_res(error_bin, file)
    ClassName.check_class_name_res(error_bin, file)
    UnusedVarChecker.check_unused_var_res(error_bin, file)

    error_bin
  end

  def self.init_files_linting(error_bin, path)
    if CheckJsFiles.find_file(path)
      start_all(error_bin, path)
    else
      puts "No such File as #{path}".yellow
    end
  end

  def self.init_dir_linting(error_bin, path)
    if CheckJsFiles.find_dir(path)
      files = CheckJsFiles.seek_js(path)
      files.each { |file| start_all(error_bin, file) } if files
    else
      CheckJsFiles.find_dir(path)
    end
  end
end
