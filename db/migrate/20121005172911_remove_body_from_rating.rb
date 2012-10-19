class RemoveBodyFromRating < ActiveRecord::Migration
  def up
    remove_column :ratings, :body
  end

  def down
    add_column :ratings, :body, :text
  end
end
