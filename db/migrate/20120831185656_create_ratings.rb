class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :body
      t.integer :recipe_id

      t.timestamps
    end
  end
end
