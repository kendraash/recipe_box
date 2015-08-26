class RemoveIdColumnsFromRecipes < ActiveRecord::Migration
  def change
    remove_column(:recipes, :dish_id)
    remove_column(:recipes, :ingredient_id)
    remove_column(:recipes, :recipe_id)
    add_column(:ingredients, :dish_id, :integer)
    add_column(:ingredients, :recipe_id, :integer)
  end
end
