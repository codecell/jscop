# Locate Js files in defined paths on the Terminal

module CheckJsFiles
  def self.find_file(path)
    puts "No such File as #{path}" if !File.exist?(path)

    File.exist?(path)
  end

  def self.find_dir(path)
    puts "No such Folder as #{path}".yellow unless Dir.exist?(path)

    Dir.exist?(path)
  end

  def self.seek_js(*path)
    if path[0]
      files = Dir["#{path[0]}/**/*.js"]
      return files if !files.empty?

      puts "No JS files found in #{path[0]} Path" if files.empty?
    else
      files = Dir['./**/*.js']
      return files if !files.empty?

      puts 'No JS files found in this Folder' if files.empty?
    end
  end
end
