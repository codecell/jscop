class Error
  attr_accessor :line, :message

  def initialize(line, message)
    @line = line
    @message = message
  end

  def print_space_err(line, error)
    mess = "#{error} At line #{line}"
    p mess
  end

  def print_naming_err(line, error)
    mess = "#{error} At line #{line}"
    p mess
  end
end
