class RemoveImageUrlFromRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :image_url
  end

  def down
    add_column :recipes, :image_url, :string
  end
end
