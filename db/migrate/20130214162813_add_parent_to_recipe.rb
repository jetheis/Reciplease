class AddParentToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :parent, :int
  end
end
