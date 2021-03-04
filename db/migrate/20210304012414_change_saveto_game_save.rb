class ChangeSavetoGameSave < ActiveRecord::Migration[6.1]
  def change
    rename_table :saves, :gamesaves
  end
end
