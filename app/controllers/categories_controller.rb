class CategoriesController < ApplicationController

  def new
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(name: params[:name])
    redirect_to root_path
  end

end
