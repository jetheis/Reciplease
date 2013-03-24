class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @users = User.all
    
    if(!@user.active)
      if(@user == current_user)
        redirect_to reactivation_path
      else
      flash[:notice] = "This user's account is currently disabled and cannot be viewed."
      redirect_to root_path
      end
    else
      respond_to do |format|
        format.html
        format.json do
          render json: @user.api_hash
        end
      end
    end
  end
  
  def reactivate
    current_user.update_attribute(:active, true)
    flash[:notice] = "Welcome back to Reciplease!"   
    redirect_to user_path(current_user.id)
  end
end