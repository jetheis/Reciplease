class Rating < ActiveRecord::Base
  attr_accessible :score, :recipe_id, 
:user_id

  belongs_to :recipe
  belongs_to :user

  validates_presence_of :score, :recipe_id, :user_id
  validates_uniqueness_of :recipe, :scope => [:user_id]
  validates :score, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :presence => true

end
