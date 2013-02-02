class Recipe < ActiveRecord::Base
  
  # A commenting gem, simplifies the process
  opinio_subjectum
  
  ## Validations
  validates_presence_of :name, :owner, :description, :instructions
  validates_uniqueness_of :name, :case_sensitive => false, :scope => [:owner_id, :base_id]

  ## Relationships
  belongs_to :owner, :class_name => "User"
  # should we add in User: has_many :recipes, :foreign_key => "owner_id" ?
  belongs_to :base, :class_name => "Recipe"
  has_many :forks, :class_name => "Recipe", :foreign_key => "base_id"
  
  # included ingredient descriptions can be accessed indirectly through the many-to-many table 'ingredient'
  has_many :ingredients
  has_many :ingredient_descs, :through => :ingredients
  
  ## Accessibile attributes
  attr_accessible :name, :owner_id, :description, :instructions, :base, :forks, :ingredients
  # we should limit the length of :description 
end
