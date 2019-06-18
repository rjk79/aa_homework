require "colorize"
class Simon
  COLORS = %w(r b g y)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      take_turn 
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    guess = []
    until guess.length == self.sequence_length
      guess << require_sequence
    end
    self.game_over = true if guess != self.seq
    
    if !game_over
      round_success_message
    end
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    self.seq.each {|color| 
      case color
      when "r" 
        puts "red".colorize(:red)
      when "b"
        puts "blue".colorize(:cyan)
      when "g"
        puts "green".colorize(:green)
      when "y"
        puts "yellow".colorize(:yellow)
      end
      }
    sleep(1)
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
    sleep(2)
    self.seq = []
  end
end

s = Simon.new
s.play