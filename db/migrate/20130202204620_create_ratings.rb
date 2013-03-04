class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score, :null => false
      t.references :recipe, :null => false
      t.references :user, :null => false

      t.timestamps
    end
    add_index :ratings, [:recipe_id, :user_id], :unique => true
  end
end
