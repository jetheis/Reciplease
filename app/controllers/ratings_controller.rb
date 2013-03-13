class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @recipe = Recipe.find_by_id(params[:recipe_id])
    is_logged_in = current_user != nil
    @rating = Rating.new(params[:rating])
    @rating.recipe_id = @recipe.id
    @rating.user_id = current_user.id
    
    respond_to do |format|
      if not is_logged_in
        format.html { render action: "new", alert: "You need to login to rate recipes.", status: :unauthorized }
        format.json { render json: @rating.errors, status: :unauthorized }
      elsif @rating.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Rating was successfully created.' }
        format.json { render json: @rating, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
    
   # if @rating.save
    #  respond_to do |format|
     #   format.html { redirect_to recipe_path(@recipe), :notice => "Your rating has been saved" }
      #  format.js
       # format.json {render json: @rating, status: :created, location: @recipe}
      #end   
    #end
  end

  def update
    @recipe = Recipe.find_by_id(params[:recipe_id])
    is_logged_in = current_user != nil
    
    if is_logged_in
      @rating = current_user.ratings.find_by_recipe_id(@recipe.id)
    end
    # need a way to ensure that only a ratings owner may edit it.
    # is_owner = current_user == @rating.user_id
    respond_to do |format|
      if not is_logged_in
        format.html { render action: "new", alert: "You need to login to edit ratings.", status: :unauthorized }
        format.json { render json: @rating.errors, status: :unauthorized }
      #elsif not is_owner
       # format.html { redirect_to recipe_path(@recipe), alert: "You can only edit your own rating.", status: :unauthorized }
       # format.json {render json: @rating.errors, status: :unauthorized}
      elsif @rating.update_attributes(params[:rating])
        format.html { redirect_to recipe_path(@recipe), :notice => "Your rating has been updated" }
        format.json { render json: @rating, status: :updated, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
    #if @rating.update_attributes(params[:rating])
     # respond_to do |format|
      #  format.html { redirect_to recipe_path(@recipe), :notice => "Your rating has been updated" }
       # format.js
       # format.json
      #end
    #end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:recipe_id])
    is_logged_in = current_user != nil
    
    if is_logged_in
      @rating = current_user.ratings.find_by_recipe_id(@recipe.id)
    end
    # See above function
    # is_owner = current_user == @rating.user_id
    respond_to do |format|
      if not is_logged_in
        format.html { render action: "new", alert: "You need to login to delete delete.", status: :unauthorized }
        format.json { render json: @rating.errors, status: :unauthorized }
      #elsif not is_owner
       # format.html { render action: "new", alert: "You can only delete your own delete.", status: :unauthorized }
       # format.json {render json: @rating.errors, status: :unauthorized}
      elsif @rating.update_attributes(params[:rating])
        format.html { redirect_to recipe_path(@recipe), :notice => "Your rating has been deleted" }
        format.json { render json: @rating, status: :deleted, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
   # if @rating.destroy
    #  respond_to do |format|
     #   format.html { redirect_to recipe_path(@recipe) }
      #  format.js
       # format.json { head :no_content }
     # end
   # end
  end
end
