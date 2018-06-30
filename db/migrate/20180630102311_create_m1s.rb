class CreateM1s < ActiveRecord::Migration
  def change
    create_table :m1s do |t|
       t.integer :user_id
       t.integer :food_id

      t.timestamps null: false
    end
  end
end
