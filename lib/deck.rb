class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_cards_at(index)
    return @cards[index].rank
  end

  def highest_ranking_cards
  end

  def percent_high_ranking
  end

  def remove_card
  end

  def add_card
  end

end
