class GamesController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :current_user

  def create
  end

  def index
    @games = Game.all
    @games = Game.paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @game = Game.find(params[:id])
    @players = @game.users
  end

  def search
    @games = Game.search(params[:search]).order("created_at DESC")

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
   Game.column_names.include?(params[:sort]) ? params[:sort] : "name"
 end

 def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
 end
end
