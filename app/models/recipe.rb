class Recipe < ActiveRecord::Base
  
  ## Validations
  validates_presence_of :name, :owner, :ingredients, :description, :instructions

  ## Relationships
  belongs_to :owner, :class_name => "User"
  # should we add in User: has_many :recipes, :foreign_key => "owner_id" ?
  belongs_to :parent, :class_name => "Recipe"
  has_many :forks, :class_name => "Recipe", :foreign_key => "parent_id"
  
  # User Favorites
  has_many :fav_recipes
  has_many :users, :through => :fav_recipes

  # ratings
  has_many :ratings
  
  def average_rating
    @score = 0
    self.ratings.each do |rating|
        @score = @score + rating.score
    end
    @count = self.ratings.size
    return @score.to_f / @count.to_f
  end
  
  ## Accessibile attributes

  attr_accessible :name, :owner_id, :description, :instructions, :forks, :ingredients, :image, :parent_id
  
   has_attached_file :image, styles: {
    thumb: '100x100',
    square: '200x200',
    medium: '300x300'
  }
  
  #def to_param
  #  "#{id}/#{name}"
  #end
  
  
  def self.api_rep
    Recipe.order("name ASC").all.map do |recipe|
      recipe.api_hash
    end
  end
  
  def api_hash
    {
      id: self.id, name: self.name, description: self.description, instructions: self.instructions, owner_id: self.owner_id, parent_id: self.parent_id, picture: self.image
    }
  end

end
