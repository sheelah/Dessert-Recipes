class AddContentTypeAndDataToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :content_type, :string
    add_column :recipes, :data, :string
  end
end
