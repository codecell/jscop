require_relative './line'

class JsParser
  attr_reader :filename, :lines

  def initialize(filename)
    @filename = filename
    @lines = []
    set_lines
  end

  def set_lines
    file = File.open(@filename)

    all_lines = file.readlines.map(&:chomp)
    init_lines = lambda {|val, index|
      line = Line.new(index + 1, val, @filename)
      @lines << line
    }

    all_lines.each_with_index(&init_lines)
  end
end
