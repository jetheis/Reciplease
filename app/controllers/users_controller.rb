class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @users = User.all
    @user_recipes = Recipe.where(:owner_id => @user)
    @fav_recipes = Recipe.where(:id => Fav_Recipe.where(:user_id => @user).select("recipe_id"))
    respond_to do |format|
      format.html
      format.json do
        render json: @user.api_hash
      end
    end
  end
end