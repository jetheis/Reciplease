class CommentsController < ApplicationController
  
  def add_comment
    # Create a comment with the user submitted content
    c= Comment.new(params[:comment])
    # Assign this comment to the logged in user
    c.user_id = current_user.id
  
    if c.save
      redirect_to :controller => c.commentable_type, :action => 'show', :id => c.commentable_id
    else
      flash[:notice] = "Comment failed to save, please try again!"
    end
  end
  
  def destroy
    c = Comment.find(params[:id])
    c.destroy
    
    redirect_to :controller => c.commentable_type, :action => 'show', :id => c.commentable_id
  end
  
end