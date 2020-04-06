class Error
  attr_accessor :line, :message

  def initialize(line, message)
    @line = line
    @message = message
  end

  def print_err(line, error)
    mess = "#{error} At line(s) #{line}"
    mess
  end
end
