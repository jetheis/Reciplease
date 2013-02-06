class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @user_recipes = Recipe.where(:owner_id => @user)
    @fav_recipes = Recipe.where(:id => Fav_Recipe.where(:user_id => @user).select("recipe_id"))
  end
end