class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string  :name,        null: false
      t.integer  :manager,     null: false
      t.float :price,         null: false
      t.integer :currency_id, null: false
      t.timestamps
    end
  end
end
