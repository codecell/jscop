class Line
  attr_reader :number, :content, :filename

  def initialize(number, content, filename)
    @number = number
    @content = content
    @filename = filename
  end
end
