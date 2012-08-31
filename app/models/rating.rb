class Rating < ActiveRecord::Base
  attr_accessible :body, :recipe_id
  belongs_to :recipe
end
