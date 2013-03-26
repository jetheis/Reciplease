class CommentsController < ApplicationController
  
  def add_comment
    # Create a comment with the user submitted content
    c= Comment.new(params[:comment])
    # Assign this comment to the logged in user
    c.user_id = current_user.id
  
    if comment.save
      redirect_to :controller => comment.commentable_type, :action => 'show', :id => comment.commentable_id
    else
      flash[:notice] = "Comment failed to save, please try again!"
    end
  end
  
  def destroy
    c = Comment.find(params[:id])
    c.destroy
    
    redirect_to :controller => comment.commentable_type, :action => 'show', :id => comment.commentable_id
  end
  
end