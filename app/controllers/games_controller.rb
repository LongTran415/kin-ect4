class GamesController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :current_user

  def create
  end

  def index
    @games = Game.all[0..10]
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

private

 def sort_column
  params[:sort] || "name"
 end

 def sort_direction
  params[:direction] || "asc"
 end
end
