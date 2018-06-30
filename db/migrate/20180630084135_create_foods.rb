class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :fname
      t.string :material1
      t.string :material2

      t.timestamps null: false
    end
  end
end
