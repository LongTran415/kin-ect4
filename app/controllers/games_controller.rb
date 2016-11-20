class GamesController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :current_user

  def index
    @categories = Category.all
    @games = Game.all[0..20]
  end

  def show
    @game = Game.find(params[:id])
    @players = @game.users
  end

  def search
    @categories = Category.all
    @games = Game.where(category_id: params[:category_id])
    render :index
  end

  def upvote
    @game = Game.find(params[:id])
    @game.votes.create(user_id: current_user.id, upvote: true)
    redirect_to(games_path)
  end

  def downvote
    @game = Game.find(params[:id])
    @game.votes.create(user_id: current_user.id, upvote: false)
    redirect_to(games_path)
  end
end
