class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password

  # validate email
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }

  has_many :guidances, dependent: :destroy
  has_many :farmers, through: :guidances
end