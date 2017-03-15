class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @game = Game.find(params[:game_id])
    @subscription = Subscription.create(user_id: params[:user_id], game_id: params[:game_id])
    redirect_to root_path
  end

  def destroy
    @game = Game.find(params[:game_id])
    @subscriptions = @game.subscriptions
    @sub = @subscriptions.where(game_id: @game.id, user_id: current_user)
    @sub[0].destroy
    redirect_to root_path
  end
end
