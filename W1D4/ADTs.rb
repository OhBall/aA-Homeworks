class Stack



  def initialize
    @stack = []
  end

  def add(el)
    self.stack << el
  end

  def remove
    self.stack.shift
  end

  def show
    self.stack.dup
  end

  private
  attr_accessor :stack

end
