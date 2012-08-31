# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.delete_all
Rating.delete_all


# Create recipe rows
Recipe.create(
  :name => "Flourless chocolate cookies",
  :content => "Here is the detailed recipe.  Combine the" +
    "following ingredients below.  Enjoy!!!",
  :image_url => "choc1.jpg"
)
Recipe.create(
  :name => "Apples with greek yogurt dip",
  :content => "A delicious and nutritious dessert!  Combine the" +
    "following ingredients below.  Enjoy!!!",
  :image_url => "apple1.jpg"
)

# Create rating rows
Rating.create(
	:body => "Tried it last night.  Loved it! The best....",
	:recipe_id => 1
)
Rating.create(
	:body => "Tried it last night.  Loved it! The best....",
	:recipe_id => 2
)