require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context "on a new subscription" do
    user = User.create name: 'long', email:'long@gmail.com', password: 'password', password_confirmation: 'password'
    game = Game.new title: "", body: "A Strategy game", category_id: 154
    subscription = Subscription.new(user_id: user.id, game_id: game.id)

    it "has an association to games" do
      expect(subscription.game_id).to eq game.id
    end

    it "has an association to a user" do
      expect(subscription.user_id).to eq user.id
    end
  end
end
