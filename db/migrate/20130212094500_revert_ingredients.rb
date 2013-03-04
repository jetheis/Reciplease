class RevertIngredients < ActiveRecord::Migration
  #require_relative '20130113183207_add_recipe_ingredient.rb'

  def up
    drop_table(:ingredient_desc)
    drop_table(:ingredients)
  end

  def down
    # Shamelessly copy-pasta'd
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
