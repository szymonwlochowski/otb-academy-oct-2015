require_relative '../lib/Game'
RSpec.describe "Game" do
  let(:generator) { double("generator", :generate_word => "rabbit")}
  let(:display) { double("display")}
  let(:game) { Game.new(generator, display) }

  context "when initialized" do

    it "generates a word" do
      expect( generator ).to receive(:generate_word)
      allow( display ).to receive(:display_word).with(anything)
      allow( display ).to receive(:display_scaffold).with(anything)
      allow( display ).to receive(:display_bad_guesses).with(anything)
      game = Game.new(generator, display)
    end

    it "displays state of the game" do
      expect( display ).to receive(:display_word).with(anything)
      expect( display ).to receive(:display_scaffold).with(anything)
      expect( display ).to receive(:display_bad_guesses).with(anything)
      game = Game.new(generator, display)
    end

  end

  context "when playing the game" do

    it "handles incorrect guess" do
      expect( display ).to receive(:display_scaffold).with(1)
      expect( display ).to receive(:display_bad_guesses).with("e")
      game.guess("e")
    end

    it "handles correct guess" do
      expect( display ).to receive(:display_word).with("r_____")
      game.guess("r")
    end

    it "handles correct guess with multiple hits" do
      expect( display ).to receive(:display_word).with("__bb__")
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
      9.times { game.guess("x") }
    end

  end

end
