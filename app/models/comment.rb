class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  
  attr_accessible :comment, :commentable_type, :commentable_id

  default_scope -> { order('created_at ASC') }
end
