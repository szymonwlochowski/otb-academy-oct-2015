require_relative '../lib/Game'
RSpec.describe "Game" do
  let(:display) { double("display")}
  let(:word) { double("word")}
  let(:bad_guesses) { double("bad_guesses")}
  let(:scaffold) { double("scaffold")}
  let(:generator) { double("generator", :generate_word => word)}
  let(:game) { Game.new(generator, 
    display, 
    bad_guesses, 
    scaffold) }

  context "when initialized" do

    it "generates a word" do
      expect( generator ).to receive(:generate_word)
      allow( display ).to receive(:display_word)
      allow( display ).to receive(:display_scaffold)
      allow( display ).to receive(:display_bad_guesses)
      allow( scaffold).to receive(:progress)
      game = Game.new(generator, 
                      display, 
                      bad_guesses, 
                      scaffold)
    end

    it "displays state of the game" do
      allow(word).to receive(:to_s).and_return('_ _ _ _ _ _')
      allow(scaffold).to receive(:progress).and_return(0)
      allow(bad_guesses).to receive(:to_s).and_return('')

      expect( display ).to receive(:display_word).with('_ _ _ _ _ _')
      expect( display ).to receive(:display_scaffold).with(0)
      expect( display ).to receive(:display_bad_guesses).with('')
      game = Game.new(generator, 
                      display, 
                      bad_guesses, 
                      scaffold)
    end

  end

  xcontext "when playing the game" do

    it "handles incorrect guess" do
      expect( display ).to receive(:display_scaffold).with(1)
      expect( display ).to receive(:display_bad_guesses).with("e")
      game.guess("e")
    end

    it "handles correct guess" do
      expect( display ).to receive(:display_word).with("r _ _ _ _ _")
      game.guess("r")
    end

    it "handles correct guess with multiple hits" do
      expect( display ).to receive(:display_word).with("_ _ b b _ _")
      game.guess("b")
    end

  end

  xcontext "at the end of the game" do

    it "handles winning correctly" do
      expect( display ).to receive(:display_end_game).with("you won")
      game.guess("r")
      game.guess("a")
      game.guess("b")
      game.guess("i")
      game.guess("t")
    end

    it "handles winning correctly by guessing the whole word" do
      expect( display ).to receive(:display_end_game).with("you won")
      game.guess_word("rabbit")
    end

    it "handles loosing correctly" do
      expect( display ).to receive(:display_end_game).with("you lost")
      ["x", 'y', 'c', 'd', 'e', 'f', 'g', 'h', 'j'].each { |letter| 
        game.guess(letter)
      }
      # 9.times { game.guess(["x", 'y', 'c', 'd', 'e', 'f']) }
    end

  end

end
