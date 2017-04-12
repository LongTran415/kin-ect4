class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def friendship
    @user = User.find(params[:id])
    current_user.friends << @user
    redirect_to user_path(current_user)
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @games = @user.games
    @friends = @user.friends
    @friend = Friendship.where(user_id: current_user.id, friend_id: @user.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @friend = Friendship.where(user_id: current_user.id, friend_id: @user.id)
    @friend[0].destroy

    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
