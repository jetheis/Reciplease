class Comment < ActiveRecord::Base
  opinio
  
  # This allows us to overwrite Opinio's default user_id of 0
  attr_accessible :user_id
end
