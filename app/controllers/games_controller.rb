class GamesController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :current_user

  def create
  end

  def index
    @categories = Category.all
    @all_games = Game.all[0..10]
    if params[:search]
      @games = Game.search(params[:search]).order("created_at DESC")
    else
      @games = Game.all.order('created_at DESC')[0..5]
    end
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
