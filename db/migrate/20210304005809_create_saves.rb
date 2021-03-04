class CreateSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :saves do |t|
      t.integer :user_id
      t.string :player
      t.string :inventory
      
      t.timestamps
    end
  end
end
