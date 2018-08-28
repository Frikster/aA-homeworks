class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      @sequence_length += 1
      self.round_success_message
    end
  end

  def show_sequence
    @sequence_length.times{self.add_random_color}
    puts(@seq)
  end

  def require_sequence
    until @seq.length <= 0 || @game_over
      begin
        puts("Pick a colour")
        @game_over = true if @seq.shift != gets.chomp
      rescue
        puts("Only [red blue yellow green] can be correct")
        retry
      end
    end
  end

  def add_random_color
    @seq << %w(red blue yellow green).sample
  end

  def round_success_message
    puts("success")
  end

  def game_over_message
    puts("game over")
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
