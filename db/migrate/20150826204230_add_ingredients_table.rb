class AddIngredientsTable < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:measurement, :string)
      t.column(:recipe_id, :integer)
    end
  end
end
