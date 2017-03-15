require 'rails_helper'

RSpec.describe Vote, type: :model do
  context "on a new friendship" do
    it "stores the vote count by changing 'upvote' to true" do
      category = Category.create(name: "Mind Games")
      u = User.create name: 'bob', email:'bob@gmail.com', password: 'password', password_confirmation: 'password'
      game = Game.create title: "Chess", body: "A Strategy game", category_id: category.id
      v = game.votes.create(user_id: u.id, upvote: true)
      expect(game.votes.first).to eq v
    end
  end
end
