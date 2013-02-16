class Farmer < ActiveRecord::Base
  attr_accessible :name

  has_many :guidances, dependent: :destroy
  has_many :users, through: :guidances
end
