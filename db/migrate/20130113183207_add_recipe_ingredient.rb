class AddRecipe < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.string :name
      # TODO: This will be removed upon fully implementing Ingredients
      t.string :ingredients
      t.string :description
      t.string :instructions
      t.references :resource, :polymorphic => true
      t.references :owner, :class_name => "User"
      t.references :base, :class_name => "Recipe"

      t.timestamps
    end
  end
end
