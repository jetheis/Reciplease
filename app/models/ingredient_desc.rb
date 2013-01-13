class Ingredient_Desc < ActiveRecord::Base
  # A description class that holds information about Ingredients
  
  ## Validations
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  
  ## Relationships
  has_many :ingredients
  # recipes using this ingredient
  has_many :recipes, :through => :ingredients
  
  ## Accessible attributes
  attr_accessible :name, :description#, :nutrition
  # todo: nutrition
end
