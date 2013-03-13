class User < ActiveRecord::Base
  include Gravtastic
  gravtastic  :secure => true,
              :filetype => :gif
  
  rolify
  
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  
  has_many :fav_recipes
  has_many :recipes, :through => :fav_recipes
  
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
    { email: self.email, name: self.name}
  end
  
  
end
