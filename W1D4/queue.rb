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
