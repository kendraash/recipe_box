class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:measurement, :string)
      t.column(:dish_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
