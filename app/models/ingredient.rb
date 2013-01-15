class Ingredient < ActiveRecord::Base
  # A many-to-many table that relates recipes to their ingredients
  # Stores the quantity of included incredients
  
  ## Validations
  validates_presence_of :recipe, :ingredient_desc, :quantity, :unit
  # You can only specify a type of ingredient once per recipe
  validates_uniqueness_of :recipe, :scope => [:ingredient_desc]
  
  #TODO: This causes a crash... what is numericality? - Rob
  # numericality :quantity, :greater_than => 0

  ## Relationships
  belongs_to :recipe
  belongs_to :ingredient_desc
  
  ## Accessible attributes
  attr_accessible :recipe, :ingredient_desc, :quantity, :unit
  # Should we have a unit field, or should we have absolute quantities and do unit conversion on the fly? 
end
