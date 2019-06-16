
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @name1 = name1
    @name2 = name2
    self.place_stones
  end

  def place_stones
    (0..13).each {|idx| 
      unless idx == 6 || idx == 13
        4.times {@cups[idx] << :stone }
      end
    }
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    #raise invalid starting cup if entered posn is not on board
    #if higher than 13 and if it is not
    if start_pos > 13 || start_pos < 0
      raise 'Invalid starting cup'
    elsif @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end 
  end

  def make_move(start_pos, current_player_name)
    hand = []
    until @cups[start_pos].empty?
      hand << @cups[start_pos].shift
    end
    i = (start_pos + 1) % 14
    until hand.empty?
      unless current_player_name == @name1 && i == 13 
        unless current_player_name == @name2 && i == 6
          @cups[i] << hand.shift  #player 1 skips 13, player 2 skips 6
        end
      end
      i += 1
      i -= 14 if i > 13
    end

    i -= 1
    i = 0 if i == -1
    self.render
    return :prompt if current_player_name == @name1 && i == 6
    return :prompt if current_player_name == @name2 && i == 13
    self.next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if @cups[ending_cup_idx].count == 1
      return :switch
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
