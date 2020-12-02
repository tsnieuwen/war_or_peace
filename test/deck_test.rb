require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test


  def test_it_exists

    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_cards_attribute

    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_shows_rank_of_card

    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 12, deck.rank_of_card_at(0)

  end

  def test_high_ranking_cards
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.high_ranking_cards
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal card1, deck.remove_card
  end

  def test_add_card
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    card4 = Card.new(:diamond, "9", 9)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal [card1, card2, card3, card4], deck.add_card(card4)
  end

end
