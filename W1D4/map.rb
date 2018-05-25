class Map

  def initialize
    @map = []
  end

  def assign(k,v)
    entry = map.select{|tuple| tuple[0]== k}
    if entry.empty?
      map << [k,v]
    else
      entry[1] = v
    end
  end

  def lookup(k)
    entry = map.select{|tuple| tuple[0] == k}
    entry.empty? ? nil : entry.last
  end

  def remove(k)
    map.each_with_index {|tuple,index| map.delete_at(index) if tuple[0] == k}
  end

  def show
    map.dup
  end

  private
  attr_accessor :map

end

if __FILE__ == $PROGRAM_NAME
  a = Map.new
  p a.show
  ('a'..'z').each do |el|
    key = el
    value = (el.ord)
    a.assign(el,el.ord+1)
  end
  p a.show
  puts "------------------"
  a.remove('t')
  a.remove('h')
  a.remove('i')
  a.remove('s')
  p a.show
end
