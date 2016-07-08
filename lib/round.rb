class Round
  attr_reader :deck,
              :guesses,
              :feedback,
              :number_correct,
              :count

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @current_card = 0
  end

  def record_guess(answer)
    card_to_check = @deck.cards[@current_card]
    @current_card += 1
    @guesses << Guess.new(answer, card_to_check) #deck.card(@current_card))
  end

  def number_correct
    guesses.find_all {|guess| guess.correct?}.length
  end

  def percent_correct
    ((number_correct.to_f / guesses.length) * 100).to_s[0..4].to_f
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.length} cards."
    puts "_______________________________________________________"

      deck.cards.each do |card|
        puts "This is card number #{guesses.length+1} out of #{deck.cards.length}."
        puts "#{card.question}"
        guess = gets.chomp
        record_guess(guess)
        puts guesses.last.feedback
      end
    message = "GAME OVER!"
    puts message.center(16, ' ').center(28, '*')
    puts "You had #{number_correct} correct guesses out of #{deck.cards.length} for a score of #{percent_correct}%."
  end
end
