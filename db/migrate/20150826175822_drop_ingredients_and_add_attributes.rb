class DropIngredientsAndAddAttributes < ActiveRecord::Migration
  def change
    drop_table(:ingredients)
    add_column(:dishes, :ingredients, :string)
    add_column(:recipes, :rating, :string)
    add_column(:recipes, :category, :string)
  end
end
