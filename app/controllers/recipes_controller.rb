class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @top_recipes = nil
    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render json: Recipe.api_rep
      end
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json do
        render json: @recipe.api_hash
      end
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    is_logged_in = current_user != nil
    respond_to do |format|
      if is_logged_in
        format.html # new.html.erb
      else
        format.html { redirect_to recipes_url, alert: "You need to login to create recipes." }
      end
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    is_logged_in = current_user != nil
    is_owner = @recipe.owner == current_user
    if not is_logged_in
      redirect_to @recipe, alert: "You need to login to edit recipes."
    elsif not is_owner
      redirect_to @recipe, alert: "You do not have permission to edit this recipe."
    end
  end
  
  # GET /recipes/1/personalize
  def personalize
    @recipe = Recipe.find(params[:id])
    @recipe.parent_id = params[:id];
    is_logged_in = current_user != nil
    is_owner = Recipe.find(params[:id]).owner == current_user
    respond_to do |format|
      if is_logged_in
        format.html # personalize.html.erb
      else
        format.html { redirect_to recipe_path(@recipe.parent_id), alert: "You need to login to personalize recipes." }
      end
      if is_owner
        format.html { redirect_to edit_recipe_path }
      end
    end
  end

  # POST /recipes
  # POST /recipes.json 
  def create
    is_logged_in = current_user != nil
    @recipe_fields = params[:recipe]
    if is_logged_in
      @recipe_fields[:owner_id] = current_user.id
    end
    @recipe = Recipe.new(@recipe_fields)
    respond_to do |format|
      if not is_logged_in
        format.html { render action: "new", alert: "You need to login to create recipes.", status: :unauthorized }
        format.json { render json: @recipe.errors, status: :unauthorized }
      elsif @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    is_logged_in = current_user != nil
    is_owner = @recipe.owner == current_user
    respond_to do |format|
      if not is_logged_in
        format.html { render action: "show", alert: "You need to login to edit recipes.", status: :unauthorized }
        format.json { render json: @recipe.errors, status: :unauthorized }
      elsif not is_owner
        format.html { render action: "show", alert: "You do not have permission to edit this recipe.", status: :forbidden }
        format.json { render json: @recipe.errors, status: :forbidden }
      elsif @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])   
    is_logged_in = current_user != nil
    is_owner = @recipe.owner == current_user
    if is_logged_in and is_owner
      @recipe.destroy
    end  
    respond_to do |format|
      if not is_logged_in
        format.html { redirect_to @recipe, alert: "You need to login to delete recipes." }
        format.json { head :no_content, status: :unauthorized }
      elsif not is_owner
        format.html { redirect_to @recipe, alert: "You do not have permission to delete this recipe." }
        format.json { head :no_content, status: :forbidden }
      else
        # Success
        format.html { redirect_to recipes_url }
        format.json { head :no_content }
      end
    end
  end
end
