class CommentsController < ApplicationController
  
  def add_comment
    commentable_type = params[:commentable_type]
    commentable_id = params[:commentable_id]
      
    # Create a comment with the user submitted content
    comment = Comment.new(params[:comment])
    # Assign this comment to the logged in user
    comment.user_id = current_user.id
  
    if comment.save
      #TODO: Fix this so it redirects properly
      redirect_to :id => comment.commentable_id, :controller => comment.commentable_type
    else
      #TODO: Add an error message if comment did not save
    end
  end
end