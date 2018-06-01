class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      if count < @size
        @cache << el
      else
        @cache.shift
        @cache << el
      end
    end
  end

  def show
    p @cache
  end

end
