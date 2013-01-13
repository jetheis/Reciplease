class User < ActiveRecord::Base
  include Gravtastic
  gravtastic  :secure => true,
              :filetype => :gif
  
  rolify
  
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  
  # has_many :recipes, :foreign_key => "owner_id"
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
end
