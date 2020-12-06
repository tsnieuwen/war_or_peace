require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class Game

  def initialize
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    start_the_game = gets.chomp
  end
end
