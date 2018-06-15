class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, presence: true
      t.integer :ord, presence: true
      t.boolean :bonus?, default: false
      t.string :lyrics


      t.integer :album_id, presence: true
    end
    add_index :tracks, :album_id
  end
end
