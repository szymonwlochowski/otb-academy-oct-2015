class Scaffold

  def progress
    
  end
end
class BadGuesses
end

class Game 

	def initialize(generator, display, bad_guesses, scaffold)
		@generator = generator
    @display = display
    @bad_guesses = bad_guesses
    @scaffold = scaffold
    start_game
	end

  def start_game
    @word = @generator.generate_word
    @display.display_word(@word.to_s)
    @display.display_scaffold(@scaffold.progress)
    @display.display_bad_guesses(@bad_guesses.to_s)
  end



end