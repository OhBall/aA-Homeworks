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
    until game_over
      take_turn
    end
    game_over_message

  end

  def take_turn
    add_random_color
    show_sequence
    system "clear"
    require_sequence

    unless game_over
      round_success_message
    end
    self.sequence_length += 1
  end

  def show_sequence
    puts "Sequence:"
      self.seq.each do |color|
        print "#{color} "
        sleep(1)
      end
  end

  def require_sequence
    Print "Now you try: "
    input = gets.chomp
    input_sequence = input.delete(" ").split{""}
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
