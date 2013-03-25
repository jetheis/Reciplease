module CommentHelper

  def fetch_comments(type, id)
    # Fetch the ten most recent comments and put them in order by most recent
    comments = Comment.where(:commentable_type => type, :commentable_id => id)
    paginated_comments = comments.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end
  
end