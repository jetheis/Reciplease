class UsersController < ApplicationController
  before_filter :authenticate_user!

  # TODO: This is used for restricting display to admin, this needs to be updated
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end