class Scaffold
end
class BadGuesses
end

class Game 

	def initialize(generator, display)
		@generator, @display = generator, display
    start_game
	end

  def start_game
    @word = @generator.generate_word
    @scaffold = Scaffold.new
    @bad_guesses = BadGuesses.new
    @display.display_word(@word)
    @display.display_scaffold(@scaffold)
    @display.display_bad_guesses(@bad_guesses)
  end

end