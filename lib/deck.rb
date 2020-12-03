class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    return @cards[index].rank
  end

  def high_ranking_cards
    highest_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        highest_ranking_cards << card
      end
      highest_ranking_cards = highest_ranking_cards.uniq
    end
    return highest_ranking_cards
  end

  def percent_high_ranking
    highest_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        highest_ranking_cards << card
      end
    end
    highest_ranking_cards = highest_ranking_cards.uniq
    num_high_ranking = highest_ranking_cards.count
    num_cards_total = @cards.count
    num_high_ranking = num_high_ranking.to_f
    num_cards_total = num_cards_total.to_f
    answer = (num_high_ranking/num_cards_total) * 100.00
    answer.round(2)

  end

  def remove_card
    highest_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        highest_ranking_cards << card
      end
    end
    highest_ranking_cards = highest_ranking_cards.uniq
    if @cards[0].rank >= 11
      highest_ranking_cards.delete(@cards[0])
    end
    @cards.delete_at(0)

  end

  def add_card(added_card)
    @cards << added_card
  end
end
