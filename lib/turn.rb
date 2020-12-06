class Turn
attr_reader :player1,
            :player2,
            :spoils_of_war

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        @winner = player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        @winner = player2
      end
    else
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        "No Winner"
      end
    end
  end

  def pile_cards
    if type == :basic
        @spoils_of_war << player1.deck.cards[0]
        @spoils_of_war << player2.deck.cards[0]
        player1.deck.remove_card
        player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.cards[0]
        player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << player2.deck.cards[0]
        player2.deck.remove_card
      end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils
    if type == :basic
      if @winner == player1
        @spoils_of_war.each do |spoil|
          player1.deck.add_card(spoil)
        end
        @spoils_of_war.clear
      elsif @winner == player2
        @spoils_of_war.each do |spoil|
          player2.deck.add_card(spoil)
        end
        @spoils_of_war.clear
      end
    elsif type == :war
      if @winner == player1
        @spoils_of_war.each do |spoil|
          player1.deck.add_card(spoil)
        end
        @spoils_of_war.clear
      elsif @winner == player2
        @spoils_of_war.each do |spoil|
          player2.deck.add_card(spoil)
        end
        @spoils_of_war.clear
      end
    end
  end

end
