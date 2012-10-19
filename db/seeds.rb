# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.delete_all
Rating.delete_all
User.delete_all

# Create users
user1 = User.create(
  :name => "Conny Smith",
  :password => "hello1",
  :password_confirmation => "hello1"
  )
user2 = User.create(
  :name => "Jason Ward",
  :password => "test123",
  :password_confirmation => "test123"
  )

# Create recipe rows
user1.recipes.create(
  :name => "Flourless chocolate cookies",
  :ingredients => "1 c sugar\n 3 egg whites\n 1 t cinnamon\n 1 t baking soda\n 1/c cocoa powder",
  :instructions => "Combine the" +
    "following ingredients below.  Enjoy!!! Enjoy! Enjoy! Enjoy!",
)
user2.recipes.create(
  :name => "Apples with greek yogurt dip",
  :ingredients => "1 apple, sliced\n 1/8 t cinnamon\n 1/4 c greek yogurt\n
    1 t peanut butter",
  :instructions => "A delicious and nutritious dessert!  Combine the +
    following ingredients below.  Enjoy!!! Apples are soooooooooooo good for you. So, so, so, so, so, sooooooooooooooooooooooo good.",
)

# Create rating rows
user1.ratings.create(
	:comment => "Tried it last night.  Loved it! One of the very best....",
  :stars => 4,
	:recipe_id => 1
)
user2.ratings.create(
	:comment => "Tried it last night.  Loved it! The best...  And I love love love love love love apples -- anything apple-related.",
  :stars => 5,
	:recipe_id => 2,
)
