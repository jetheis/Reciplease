module RecipesHelper

  # Return's the current user's rating object for the current recipe
  # Or returns a new rating object
  def rating_ballot
    if @rating = current_user.ratings.find_by_recipe_id(params[:id])
      @rating
    else
      current_user.ratings.new
    end
  end

  def current_user_rating
    if @rating = current_user.ratings.find_by_recipe_id(params[:id])
      @rating.score
    else
      "N/A"
    end
  end
  
end
