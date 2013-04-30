class User < ActiveRecord::Base
  include Gravtastic
  gravtastic  :secure => true,
              :filetype => :gif
              
  acts_as_commentable
              
  # Used to create user roles, which at this point, are unused.
  rolify
              
  before_save :default_values, on: :create
  
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  
  has_many :recipes, :foreign_key => :owner_id
  has_many :ratings
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :active, :bio

  def self.api_rep
    User.order("name ASC").all.map do |user|
      user.api_hash
    end
  end

  def api_hash
    { email: self.email, name: self.name }
  end

  def default_values
    if self.active == nil
      self.active = true
    end
  end
end
