module CommentHelper

  def fetch_comments(type, id)
    # Fetch the ten most recent comments and put them in order by most recent
    comments = Comment.where(:commentable_type => type, :commentable_id => id).recent.limit(10).all.reverse
  end
  
end