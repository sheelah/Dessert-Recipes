class AddImageTypeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :image_type, :string
  end
end
