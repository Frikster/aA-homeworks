require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [:stone] * 4 }
    @cups[6] = []
    @cups[13] = []
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, 5) || start_pos.between?(7, 12)
      raise 'Invalid starting cup'
    end
    raise 'Starting cup is empty' if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    idx = start_pos
    stones = @cups[idx]
    until stones.empty?
      idx = (idx + 1) % @cups.length
      # debugger
      if (current_player_name == @name1 && idx != 13) ||
         (current_player_name == @name2 && idx != 6)
        stone = stones.pop
        @cups[idx] << stone
      end
    end
    render
    next_turn(idx)

    # BELOW YE SHALL SEE ME TRYING TO DO EVERYTHING AT ONCE
    # I shall slowly learn not to do this.
    # render
    # idx = start_pos
    # until @cups[idx].length == 1
    #   stones = @cups[idx]
    #   # debugger
    #   until stones.empty?
    #     idx = (idx + 1) % @cups.length
    #     # debugger
    #     if (current_player_name == @name1 && idx != 13) ||
    #        (current_player_name == @name2 && idx != 6)
    #       stone = stones.pop
    #       @cups[idx] << stone
    #     end
    #   end
    # end
    # next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 13 || ending_cup_idx == 6
    return :switch if @cups[ending_cup_idx].length == 1
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
    (0..5).all?{|idx| @cups[idx].empty?} || (7..12).all?{|idx| @cups[idx].empty?}
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
