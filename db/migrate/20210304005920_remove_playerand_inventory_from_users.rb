class RemovePlayerandInventoryFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :inventory
    remove_column :users, :player
  end
end
