require 'byebug'
class Octopus
  attr_reader :fish
  def initialize
    @fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].shuffle
    @tile_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3,
                 "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}
  end

  def sluggish_search
    biggest_fish = nil
    fish.each_with_index do |fish1,idx|
      other_fish = fish[0...idx] + fish[(idx+1)...fish.length]
      biggest_fish = fish1 if other_fish.all? {|fish2| fish2.length < fish1.length}
    end
    biggest_fish
  end

  def dominant_search
    merge_sort(@fish).last
  end

  def merge_sort(arr)
    return arr if arr.length == 1
    left = arr[0...arr.length/2]
    right = arr[arr.length/2...arr.length]
    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)
    merge(sorted_left,sorted_right)
  end

  def merge(arr1, arr2)
    merged = []
    until arr1.empty? || arr2.empty?
      if arr1.first.length < arr2.first.length
        merged << arr1.shift
      else
        merged << arr2.shift
      end
    end
    merged + arr1 + arr2
  end

  def clever_search
    biggest_fish = ''
    fish.each {|fish| biggest_fish = fish if fish.length > biggest_fish.length}
    biggest_fish
  end

  def slow_dance(target, tiles_array)
    tiles_array.each_with_index {|tile,idx| return idx if tile == target}
  end

  def fast_dance(target, tile_hash)
    tile_hash[target]
  end
end

# oc = Octopus.new
# p oc.sluggish_search == 'fiiiissshhhhhh'
# p oc.dominant_search == 'fiiiissshhhhhh'
# p oc.clever_search == 'fiiiissshhhhhh'
#
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
#
# p oc.slow_dance('up', tiles_array) == 0
# p oc.slow_dance('right-down', tiles_array) == 3
#
# tile_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3,
#              "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}
# tiles_array.each_with_index {|tile,idx|tile_hash[tile] = idx}
# p tile_hash
# p oc.fast_dance('up', tile_hash) == 0
# p oc.fast_dance('right-down', tile_hash) == 3
