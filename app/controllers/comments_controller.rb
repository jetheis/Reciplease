class CommentsController < ApplicationController
  
  def add_comment
    # Create a comment with the user submitted content
    comment = Comment.new(params[:comment])
    # Assign this comment to the logged in user
    comment.user_id = current_user.id
  
    if comment.save
      redirect_to :controller => comment.commentable_type, :action => 'show', :id => comment.commentable_id
    else
      flash[:notice] = "Comment failed to save, please try again!"
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    
    redirect_to :controller => comment.commentable_type, :action => 'show', :id => comment.commentable_id
  end
  
end