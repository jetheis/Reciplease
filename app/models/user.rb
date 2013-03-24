class User < ActiveRecord::Base
  include Gravtastic
  gravtastic  :secure => true,
              :filetype => :gif
  
  #Adds the ability to give users roles
  rolify
  
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  
  has_and_belongs_to_many :fav_recipes, :class_name => "Recipe", :join_table => :fav_recipes
  has_many :recipes, :foreign_key => :owner_id
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # ratings
  has_many :ratings

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me

  def self.api_rep
    User.order("name ASC").all.map do |user|
      user.api_hash
    end
  end

  def api_hash
    { email: self.email, name: self.name }
  end
  
  
end
