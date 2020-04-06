# Locate Js files in defined paths on the Terminal

module CheckJsFiles
  def self.lint_files(err, _file)
    err
  end

  def self.find_file(path)
    puts "Could not find any JS file in the path #{path} file" unless File.exist?(path)

    File.exist?(path)
  end

  def self.find_dir(path)
    return "Could not find any JS file in the #{path} Folder" unless Dir.exist?(path)

    Dir.exist?(path)
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
