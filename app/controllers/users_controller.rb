class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json do
        render json: @user.api_hash
      end
    end
  end

end