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
  
<<<<<<< HEAD
  def api_hash
    { email: self.email, name: self.name}
=======
  def to_param
    name
>>>>>>> cb8f67e95e736b19158c7e75fc9ce4693abed1ae
  end
end
