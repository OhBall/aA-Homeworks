class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
    el
  end

  def deqeueue
    queue.shift
  end

  def show
    queue.dup
  end

  private
  attr_accessor :queue

end

if __FILE__ == $PROGRAM_NAME
  a = Queue.new
  (0..7).to_a.each {|x| a.enqueue(x)}
  p a.show
  puts "Dequeued element: #{a.deqeueue}"
  puts "Dequeued element: #{a.deqeueue}"
  puts "Dequeued element: #{a.deqeueue}"
  puts "Queue.show output: #{a.show}"
end
