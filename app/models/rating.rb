class Rating < ActiveRecord::Base
  attr_accessible :score, :user_id
end
