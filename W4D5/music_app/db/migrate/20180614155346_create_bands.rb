class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name, null: false
    end
    add_index :bands, :name
  end
end
