class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @recipe = Recipe.find_by_id(params[:recipe_id])
    
    @rating = Rating.new(params[:rating])
    @rating.recipe_id = @recipe.id
    @rating.user_id = current_user.id
    if @rating.save
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), :notice => "Your rating has been saved" }
        format.js
        format.json
      end
    end
  end

  def update
    @recipe = Recipe.find_by_id(params[:recipe_id])
    
    @rating = current_user.ratings.find_by_recipe_id(@recipe.id)
    if @rating.update_attributes(params[:rating])
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), :notice => "Your rating has been updated" }
        format.js
        format.json
      end
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:recipe_id])

    @rating = current_user.ratings.find_by_recipe_id(@recipe.id)
    if @rating.destroy
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe) }
        format.js
        format.json { head :no_content }
      end
    end
  end
end
