class Rating < ActiveRecord::Base
  attr_accessible :recipe_id, :user_id, :comment, :stars
  belongs_to :recipe
  belongs_to :user
  validates :recipe_id, :user_id, :comment, :stars, :presence => true
  validates :stars,
    numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end