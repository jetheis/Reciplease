class Add_Fav_Recipes < ActiveRecord::Migration
  def up
    create_table "fav_recipes" do |t|
      t.column "user_id", :integer
      t.column "recipe_id", :integer
    end
  end

  def down
    drop_table "fav_recipes"
  end
end
