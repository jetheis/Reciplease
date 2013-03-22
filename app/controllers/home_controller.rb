class HomeController < ApplicationController
  def index
    @users = User.all
    # TODO: Should we remove this? Maybe just redirect to the current_user page
    # respond_to do |format|
     # format.html # index.html.erb
     # format.json do
      #  render json: User.api_rep
     # end
    #end
  end
end
