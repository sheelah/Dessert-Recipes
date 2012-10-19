class RemoveContentFromRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :content
  end

  def down
    add_column :recipes, :content, :text
  end
end
