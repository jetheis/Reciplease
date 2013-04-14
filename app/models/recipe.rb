class Recipe < ActiveRecord::Base
  acts_as_commentable
  
  belongs_to :owner, :class_name => "User"
  has_many :ratings
  has_and_belongs_to_many :favoring_users, :class_name => "User", :join_table => :fav_recipes
  belongs_to :parent, :class_name => "Recipe"
  has_many :forks, :class_name => "Recipe", :foreign_key => "parent_id"

  

  validates_presence_of :name, :owner, :ingredients, :description, :instructions
  attr_accessible :name, :owner_id, :description, :instructions, :forks, :ingredients, :image, :parent_id
  
   has_attached_file :image, styles: {
    thumb: '100x100',
    square: '200x200',
    medium: '300x300'
  }
  
  def average_rating
    @score = 0
    self.ratings.each do |rating|
        @score = @score + rating.score
    end
    @count = self.ratings.size
    return @score.to_f / @count.to_f
  end
  
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
