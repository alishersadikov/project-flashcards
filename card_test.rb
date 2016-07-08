gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_if_card_is_stored
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal card.question, "What is the capital of Alaska?"
    assert_equal card.answer, "Juneau"
  end
end
