class Turn
attr_reader :player1,
            :player2,
            :spoils_of_war

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
    @type = nil
    @winner = nil
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @type = :basic
    else
      @type = :war
    end
  end

  def winner
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = player1.name
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        @winner = player2.name
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = player1.name
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        @winner = player2.name
      end
    else
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        @winner = "No Winner"
      end
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.cards.delete_at(0)
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.cards.delete_at(0)
    elsif @type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      player1.deck.cards.slice(0..2)
      @spoils_of_war << player2.deck.cards[0..2]
      player2.deck.cards.slice(0..2)
    else
      player1.deck.cards.slice(0..2)
      player2.deck.cards.slice(0..2)
    end
  end

  def award_spoils
    if @winner == player1.name
      player.deck << turn.spoils_of_war
    end
  end

end
