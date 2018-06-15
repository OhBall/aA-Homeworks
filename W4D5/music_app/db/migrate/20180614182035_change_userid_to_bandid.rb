class ChangeUseridToBandid < ActiveRecord::Migration[5.1]
  def change
    rename_column :albums, :user_id, :band_id
  end
end
