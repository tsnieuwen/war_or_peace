class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
    highest_ranking_cards = []
  end

  def rank_of_cards_at(index)
    return @cards[index].rank
  end

  def highest_ranking_cards
    @cards.each do |card|
      if card.value >= 11
        highest_ranking_cards << card
      end
    end
    return highest_ranking_cards
  end

  def percent_high_ranking
    return highest_ranking_cards.count / cards.count * 100
  end

  def remove_card
  end

  def add_card
  end

end
