class AddCommentAndStarsToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :comment, :text
    add_column :ratings, :stars, :integer
  end
end
