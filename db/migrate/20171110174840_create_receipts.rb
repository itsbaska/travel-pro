class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.decimal :total, null: false
      t.string :store, null: false
      t.integer :trip_id
      t.integer :purchaser_id
      t.string :photo_url
      t.string :purchaser_name

      t.timestamps
    end
  end
end
