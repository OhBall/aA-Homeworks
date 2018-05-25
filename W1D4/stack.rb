class Stack

  def initialize
    @stack = []
  end

  def add(el)
    stack << el
    el
  end

  def remove
    stack.pop
  end

  def show
    stack.dup
  end

  def display
    stack.each { |el| print "#{el} " }
    print "\n"
  end

  private
  attr_accessor :stack

end

if __FILE__ == $PROGRAM_NAME
  a = Stack.new
  a.display
  a.add(5)
  a.add(8)
  a.add(10)
  a.display
  puts a.remove
  a.display
  p a.show
end
