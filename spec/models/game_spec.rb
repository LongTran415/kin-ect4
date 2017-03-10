require 'rails_helper'

describe Game, type: :model do
  context "on a new game" do
    it "is not valid without a title" do
      game = Game.new title: "", body: "A Strategy game", category_id: 154
      expect(game).not_to be_valid
    end

    it "is not valid without a body" do
      game = Game.new title: "Chess", body: "", category_id: 154
      expect(game).not_to be_valid
    end

    it "is not valid without a category" do
      game = Game.new title: "Chess", body: "", category_id: nil
      expect(game).not_to be_valid
    end
  end
end
