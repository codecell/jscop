# Locate Js files in defined paths in the Terminal
module CheckJsFiles
  def self.lint_files(err, file)
    # result = check_class_number(file)
    # err << result if result
    err
  end

  def self.find_file(path)
    print "here"
    File.exist?(path) ? path : "could not find any JS file in the path #{path} file"
  end

  def self.find_dir(path)
    Dir.exist?(path) ? true : "could not find any JS file in the #{path} Folder"
  end

  def self.seek_js(*path)
    if path[0]
      files = Dir["#{path[0]}/**/*.js"]
      !files.empty? ? files : "No JS files found in #{path[0]} Path"
    else
      files = Dir['./**/*.js']
      !files.empty? ? files : 'No JS files found in this Folder'
    end
  end
end
