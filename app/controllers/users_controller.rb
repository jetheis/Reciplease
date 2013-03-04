class UsersController < ApplicationController
    
  def show

    @user = User.find_by_name(params[:id])
    
    respond_to do |format|
      format.html
      format.json do
        render json: @user.api_hash
      end
    end

    @user_recipes = Recipe.where(:owner_id => @user)
    @fav_recipes = Recipe.where(:id => Fav_Recipe.where(:user_id => @user).select("recipe_id"))

  end
end