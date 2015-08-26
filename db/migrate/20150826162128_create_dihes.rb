class CreateDihes < ActiveRecord::Migration
  def change
    create_table(:dishes) do |t|
      t.column(:name, :string)
      t.column(:category, :string)
    end
  end
end
