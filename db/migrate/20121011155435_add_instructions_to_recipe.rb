class AddInstructionsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :instructions, :text
  end
end
