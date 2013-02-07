class AddRecipeIngredient < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.string :name
      t.string :description
      t.string :instructions
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.references :resource, :polymorphic => true
      t.references :owner, :class_name => "User"
      t.references :base, :class_name => "Recipe"

      t.timestamps
    end

    create_table(:ingredients, :id => false) do |t|
      t.references :recipe
      t.references :ingredient_desc
      t.column :quantity, :float, :null => false
      t.column :unit, :string, :null => false
      
      t.timestamps
    end

    create_table(:ingredient_desc) do |t|
      t.column :name, :string, :null => false
      t.column :description, :string, :null => true

      t.timestamps
    end

    #add_index(:roles, :name)
    #add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:ingredients, [ :recipe_id, :ingredient_desc_id ])
  end
end
