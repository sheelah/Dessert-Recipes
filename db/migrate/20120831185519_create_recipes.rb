class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :content
      t.string :image_url

      t.timestamps
    end
  end
end
