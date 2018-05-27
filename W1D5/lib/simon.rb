class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    puts "Hi, I'm Simon. Let's play a game."
    sleep(1)
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    system "clear"
    require_sequence

    unless game_over
      round_success_message
      self.sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    puts "Sequence:"
      self.seq.each do |color|
        print "#{color} "
        sleep(1)
      end
  end

  def require_sequence
    print "Now you try: "
    input = gets.chomp
    input_sequence = input.split{" "}
    self.game_over = true unless input_sequence == self.seq
  end

  def add_random_color
    add_color(COLORS.sample)
  end

  def add_color(color)
    @seq << color
  end

  def round_success_message
    puts "Well done. Moving on to level #{sequence_length}"
  end

  def game_over_message
    puts "Game over. You got to level #{sequence_length}."
  end

  def reset_game
    self.seq = []
    self.sequence_length = 1
    self.game_over = false
  end
end
