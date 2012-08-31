class Recipe < ActiveRecord::Base
  attr_accessible :content, :image_url, :name
  has_many :ratings   # one to many relationship with ratings
end
