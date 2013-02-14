class ChangeRecipeStringsToText < ActiveRecord::Migration
  def up
    change_column :recipes, :description, :text, :limit => nil
    change_column :recipes, :instructions, :text, :limit => nil
    change_column :recipes, :ingredients, :text, :limit => nil
  end

  def down
    change_column :recipes, :description, :string
    change_column :recipes, :instructions, :string
    change_column :recipes, :ingredients, :string
  end
end
