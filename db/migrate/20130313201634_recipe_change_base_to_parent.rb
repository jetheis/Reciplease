class RecipeChangeBaseToParent < ActiveRecord::Migration
  # The purpose of this migration is to give the functionality of "base" to "parent"
  # and remove base. (Basically rename base to parent, but preserve the data already
  # in parent.)
  # 
  # It looks like parent_id is basically already what we want, minus a few constraints!
  # Alternatively, it looks like base_id is basically already what we want, minus the name
  # and data. 
  def up
    Recipe.update_all("base_id=parent")
    remove_column(:recipes, :parent)
    rename_column(:recipes, :base_id, :parent_id)
  end

  def down
    rename_column(:recipes, :parent_id, :base_id)
    add_column(:recipes, :parent, :integer)
    Recipe.update_all("parent=base_id")
  end
end
