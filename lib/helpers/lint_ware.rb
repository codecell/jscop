require_relative '../modules/check_js_files'

module LintWare
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

  def self.seek_js(*path)
    if path[0]
      files = Dir["#{path[0]}/**/*.js"]
      !files.empty? ? files : "No JS files found in #{path[0]} Path"    
    else
      files = Dir['./**/*.js']
      !files.empty? ? files : "No JS files found in this Folder"
    end
  end
end