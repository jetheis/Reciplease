class AddImageToRecipes < ActiveRecord::Migration
  def self.up
    add_attachment :recipe, :image
  end

  def self.down
    remove_attachment :recipe, :image
  end
end
