class CommentsController < ApplicationController
  
  def add_comment
    commentable_type = params[:commentable_type]
    commentable_id = params[:commentable_id]
      
    # Create a comment with the user submitted content
    comment = Comment.new(params[:comment])
    # Assign this comment to the logged in user
    comment.user_id = current_user.id
  
    comment.save
  end
end