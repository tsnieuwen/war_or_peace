require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class Game
  attr_reader :player1
              :player2

  def initialize#(player1, player2)
    # @player1 = player1
    # @player2 = player2
    # @turn =
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Ricky and Bobby."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    start_the_game = gets.chomp
    if start_the_game == "GO"

    end
  end


end
