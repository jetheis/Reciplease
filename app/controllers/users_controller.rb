class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @user_recipes = Recipe.where(:owner_id => @user)
  end
end