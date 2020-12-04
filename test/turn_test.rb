require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_has_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_type_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_type_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck3)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_type_mututal_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck4)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_winner_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.type

    assert_equal player1, turn.winner
  end

  def test_winner_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck3)
    turn = Turn.new(player1, player2)
    turn.type

    assert_equal player2, turn.winner
  end

  def test_winner_mutual_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck4)
    turn = Turn.new(player1, player2)
    turn.type

    assert_equal "No Winner", turn.winner
  end

  def test_pile_cards_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.type
    turn.pile_cards

    expected_spoils_pile = [card1, card3]

    assert_equal expected_spoils_pile, turn.spoils_of_war
  end

  def test_pile_cards_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck3)
    turn = Turn.new(player1, player2)
    turn.type
    turn.pile_cards

    expected_spoils_pile = [card1, card2, card5, card9, card4, card6]

    assert_equal expected_spoils_pile, turn.spoils_of_war
  end

  def test_pile_cards_mutual_desctuction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck4)
    turn = Turn.new(player1, player2)
    turn.type
    turn.pile_cards
    expected_player1_deck = [card8]
    expected_player2_deck = [card7]

    assert_equal expected_player1_deck, turn.player1.deck.cards
    assert_equal expected_player2_deck, turn.player2.deck.cards
  end

  def test_award_spoils_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.type
    turn.winner
    turn.pile_cards
    turn.award_spoils
    expected1 = [card2, card5, card8, card1, card3]
    expected2 = [card4, card6, card7,]
    expected_spoils = []

    assert_equal expected1, turn.player1.deck.cards
    assert_equal expected2, turn.player2.deck.cards
    assert_equal expected_spoils, turn.spoils_of_war
  end

  def test_award_spoils_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:spade, "Jack", 11)
    card10 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    deck3 = Deck.new([card9, card4, card6, card7])
    deck4 = Deck.new([card9, card4, card10, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck3)
    turn = Turn.new(player1, player2)
    turn.type
    turn.winner
    turn.pile_cards
    turn.award_spoils
    expected1 = [card8]
    expected2 = [card7, card1, card2, card5, card9, card4, card6]
    expected_spoils = []

    assert_equal expected1, turn.player1.deck.cards
    assert_equal expected2, turn.player2.deck.cards
    assert_equal expected_spoils, turn.spoils_of_war
  end

end
