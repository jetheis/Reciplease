class UsersController < ApplicationController
    
  def show
<<<<<<< HEAD
    @user = User.find_by_name(params[:id])
    
    respond_to do |format|
      format.html
      format.json do
        render json: @user.api_hash
      end
    end
=======
    @user = User.find_by_name(params[:id])
    @user_recipes = Recipe.where(:owner_id => @user)
    @fav_recipes = Recipe.where(:id => Fav_Recipe.where(:user_id => @user).select("recipe_id"))
>>>>>>> cb8f67e95e736b19158c7e75fc9ce4693abed1ae
  end
end