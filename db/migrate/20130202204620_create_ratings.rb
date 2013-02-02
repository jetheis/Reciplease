class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.int :score
      t.int :user_id

      t.timestamps
    end
  end
end
