class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @user_recipes = Recipe.where(:owner_id => @user)
    #@fav_recipes = @user.fav_recipes
  end
end