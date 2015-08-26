class CreateDishesRecipes < ActiveRecord::Migration
  def change
    create_table(:dishes_recipes) do |t|
      t.column(:dish_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
