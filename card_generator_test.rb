gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_text_file_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    assert File.exist? (filename)
  end

  def test_if_question_and_answers_stored_correctly
    cards = CardGenerator.new.cards
    assert_equal "10", cards[0].answer
    assert_equal "What is Rachel's favorite animal?", cards[1].question
  end
end
