class Recipe < ActiveRecord::Base
  
  ## Validations
  validates_presence_of :name, :owner, :ingredients, :description, :instructions

  ## Relationships
  belongs_to :owner, :class_name => "User"
  # should we add in User: has_many :recipes, :foreign_key => "owner_id" ?
  belongs_to :base, :class_name => "Recipe"
  has_many :forks, :class_name => "Recipe", :foreign_key => "base_id"
  
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
  attr_accessible :name, :owner_id, :description, :instructions, :base, :forks, :ingredients, :image, :parent
  # TODO we should limit the length of :description 
  
  has_attached_file :image, styles: {
    thumb: '100x100',
    square: '200x200',
    medium: '300x300'
  }
  
  #def to_param
  #  "#{id}/#{name}"
  #end
  
end
