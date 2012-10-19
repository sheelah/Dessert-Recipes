class Recipe < ActiveRecord::Base
  attr_accessible :name, :image_type, :data, :user_id, :ingredients,
    :instructions, :uploaded_picture
  has_many :ratings   # one to many relationship with ratings
  belongs_to :user
  validates :name, :ingredients, :instructions, :user_id, :presence => true
  validates :name, :uniqueness => true

  def self.user_recipes(user_id)
  	# Just get all recipes for one user id
    user_recipes = Recipe.find_all_by_user_id(user_id)
  end

  def uploaded_picture=(picture_field)  # setter
    # get content type by looking at temp file
    self.image_type = picture_field.content_type.chomp
    # store picture as a blob
    self.data = picture_field.read
  end

end
