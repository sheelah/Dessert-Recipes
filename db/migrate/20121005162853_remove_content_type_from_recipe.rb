class RemoveContentTypeFromRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :content_type
  end

  def down
    add_column :recipes, :content_type, :string
  end
end
