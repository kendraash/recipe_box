class ChangeDatatypeForRatingIntoInteger < ActiveRecord::Migration
  def change
    remove_column(:recipes, :rating)
    add_column(:recipes, :rating, :integer)
  end
end
