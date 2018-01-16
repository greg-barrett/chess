require 'game.rb'

describe Game do
  subject(:the_game) {Game.new}

  describe "#play" do
    it "starts game play" do
      input="Pawn 10 to 30"
      expect(the_game.play).to eql("Hey")
    end
  end
end
