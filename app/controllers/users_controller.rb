class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @users = User.all
    
    if(!@user.active)
      flash[:notice] = "This user's account is currently disabled and cannot be viewed."
      redirect_to root_path
    else
      respond_to do |format|
        format.html
        format.json do
          render json: @user.api_hash
        end
      end
    end
  end
end