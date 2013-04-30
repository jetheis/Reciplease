class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
    @comment = Comment.new
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    if(current_user == nil)
      flash[:alert] = "You must be logged in to comment"
      return_to_commentable(@comment);
    elsif(@comment.body == "")
      flash[:alert] = "You cannot post an empty comment"
      return_to_commentable(@comment);
    else
      @comment.user_id = current_user.id
      if @comment.save
        return_to_commentable(@comment);
      else
        flash[:alert] = "Comment failed to save, please try again!"
      end
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update 
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
      
    if @comment.save
      flash[:notice] = "Comment Updated!"
      return_to_commentable(@comment)
    else
      flash[:alert] = "Comment failed to save, please try again!"
     end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    return_to_commentable(@comment);
  end
  
  def return_to_commentable(comment)
    redirect_to :controller => comment.commentable_type, :action => 'show', :id => comment.commentable_id
  end
  
end