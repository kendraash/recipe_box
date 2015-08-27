class AddJoinTableForRecipesAndIngredients < ActiveRecord::Migration
  def change
    remove_column(:recipes, :ingredients)
    remove_column(:recipes, :measurement)
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
