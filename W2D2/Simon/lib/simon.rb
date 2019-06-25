require "colorize"
class Simon
  COLORS = %w(a t c g)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system "clear"
    until self.game_over
      take_turn 
    end
    game_over_message
    reset_game
    sleep(2)
    play
  end

  def take_turn
    show_sequence
    
    input = require_sequence
   
    self.game_over = true if input != self.seq.join("")
    
    if !game_over
      round_success_message
    end
    sleep(1)
    system "clear"
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    self.seq.each {|color| 
      case color
      when "a" 
        puts "a denine".colorize(:red)
      when "t"
        puts "t hymine".colorize(:cyan)
      when "c"
        puts "c ytosine".colorize(:green)
      when "g"
        puts "g uanine".colorize(:yellow)
      end
      }
    sleep(2)
    system "clear"
  end

  def require_sequence
    gets.chomp
  end

  def add_random_color
    new_color = COLORS.sample
    self.seq << new_color
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "Game over!".colorize(:red)
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq.each {|color| puts color}
    self.seq = []
    
  end
end

s = Simon.new
s.play