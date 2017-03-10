require 'rails_helper'

describe Comment, type: :model do
  context "on a new comment" do
    it "is not valid without a body" do
      game = Game.new title: "", body: "A Strategy game", category_id: 154
      user = User.new name: 'long', email:'long@gmail.com', password: 'password', password_confirmation: 'password'
      comment = Comment.new body: "", user_id: user.id, game_id: game.id
      expect(comment).not_to be_valid
    end
  end
end
