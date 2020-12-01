class Deck
attr_reader :cards, :high_ranking_cards

  def initialize(cards)
    @cards = cards
    @highest_ranking_cards = []
  end

  def rank_of_card_at(index)
    return @cards[index].rank
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
        @highest_ranking_cards << card
      end
    end
    return @highest_ranking_cards
  end

  def percent_high_ranking

    num_high_ranking = @highest_ranking_cards.count
    num_cards_total = @cards.count
    num_high_ranking = num_high_ranking.to_f
    num_cards_total = num_cards_total.to_f

    return (num_high_ranking/num_cards_total)

  end

  def remove_card
    @cards.delete(0)
  end

  def add_card(added_card)
    @cards << added_card
  end

end
