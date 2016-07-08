gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_if_guess_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end

  def test_if_guess_has_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_if_guess_is_right
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_if_guess_is_wrong
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Topeka", card)
    refute guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end
end
