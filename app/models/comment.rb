class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  
  
  attr_accessible :body, :commentable_type, :commentable_id
end
