class GamesController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :current_user

  def create
  end

  def index
    case sort_column
    when "votes"
      @games =  Game.left_joins(:votes).group(:id).order("COUNT(games.id) #{sort_direction}").limit(20)
    when "category"
      @games = Game.reorder("categories.name #{sort_direction}").includes(:category).limit(20)
    else
      @games = Game.reorder("title " + sort_direction).limit(20)  # This works for the game title
    end
    @games = Game.paginate(:per_page => 20, :page => params[:page])

  end

  def show
    @game = Game.find(params[:id])
    @game_category = @game.category
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
  params[:sort] || "title"
 end

 def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
 end
end
