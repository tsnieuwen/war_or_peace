class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    highest_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        highest_ranking_cards << card
      end
      highest_ranking_cards = highest_ranking_cards.uniq
    end
    highest_ranking_cards
  end

  def percent_high_ranking
    num_highest_ranking_cards = high_ranking_cards.count.to_f
    num_cards_total = @cards.count.to_f
    ((num_highest_ranking_cards/num_cards_total) * 100.00).round(2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(added_card)
    @cards << added_card
  end

end
