require 'pry'
class CardGenerator
  attr_reader :filename,
              :cards

  def initialize (filename="cards.txt")
    @filename = filename
    @cards = []
  end

  def cards
    File.open(@filename).readlines.map do |line|
      question, answer = line.strip!.split(",")
      Card.new(question, answer)
    end
  end
end
