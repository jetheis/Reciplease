class DropFavRecipesTable < ActiveRecord::Migration
  def up
    drop_table :fav_recipes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
