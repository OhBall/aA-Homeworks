class CreatePersonsTables < ActiveRecord::Migration[5.1]
  def change
    create_table :persons do |t|
      t.string :name, null: false
      t.integer :house_id, null: false

      t.timestamps
    end

  end
end
