class RemoveColumnIngredientsToRecipeTable < ActiveRecord::Migration
  def change
    remove_column(:dishes, :ingredients)
    add_column(:recipes, :ingredients, :string)
  end
end
