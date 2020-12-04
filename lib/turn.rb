class Turn
attr_reader :player1,
            :player2,
            :spoils_of_war

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
    @winner = nil
  end

  def type

    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      return :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        return player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        return player2
      end
    else
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        return "No Winner"
      end
    end
  end

  def pile_cards

    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player1.deck.cards[1]
      @spoils_of_war << player1.deck.cards[2]
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war << player2.deck.cards[1]
      @spoils_of_war << player2.deck.cards[2]
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils
    if type == :basic
      if winner == player1
        @spoils_of_war.each do |spoil|
          player1.deck.add_card(spoil)
        end
        player1.deck.cards.delete_at(0)
        player2.deck.cards.delete_at(0)
      elsif winner == player2
        @spoils_of_war.each do |spoil|
          player2.deck.add_card(spoil)
        end
        player1.deck.cards.delete_at(0)
        player2.deck.cards.delete_at(0)
      end
    elsif type == :war
      if winner == player1
        @spoils_of_war.each do |spoil|
          player1.deck.add_card(spoil)
        end
        player1.deck.cards.shift(3)
        player2.deck.cards.shift(3)
      elsif winner == player2
        @spoils_of_war.each do |spoil|
          player2.deck.add_card(spoil)
        end
        player1.deck.cards.shift(3)
        player2.deck.cards.shift(3)
      end
    end 
    @spoils_of_war.clear
  end
end
