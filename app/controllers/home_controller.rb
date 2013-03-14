class HomeController < ApplicationController
  def index
    @users = User.all
    # There seems to be an issue with the user index page
    # respond_to do |format|
     # format.html # index.html.erb
     # format.json do
      #  render json: User.api_rep
     # end
    #end
  end
end
