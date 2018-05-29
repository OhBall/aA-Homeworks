require 'byebug'
class Board
  attr_accessor :cups
  attr_reader :opp_stores

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    place_stones
    @name1 = name1
    @name2 = name2
    @opp_stores = {
      name1 => 13,
      name2 => 6
    }
    # debugger
  end

  def place_stones
    self.cups.each_with_index do |cup,idx|
      unless idx == 6 || idx == 13
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos < 1
    true
  end

  def make_move(start_pos, current_player_name)
    stones = self.cups[start_pos]
    self.cups[start_pos] = []
    curr_idx = start_pos
    until stones.empty?
      curr_idx += 1
      curr_idx = curr_idx % 14
      unless curr_idx == self.opp_stores[current_player_name]
        self.cups[curr_idx] << stones.pop
      end
    end
    render
    next_turn(curr_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if self.cups[ending_cup_idx].length == 1
    ending_cup_idx

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].all? { |cup| cup.empty? } ||
      self.cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
  end
end
