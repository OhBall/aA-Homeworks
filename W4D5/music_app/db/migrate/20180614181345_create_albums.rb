class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.integer :user_id, null: false
      t.boolean :live?, default: false

      t.timestamps
    end
    add_index :albums, :user_id
  end
end
