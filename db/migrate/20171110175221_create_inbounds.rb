class CreateInbounds < ActiveRecord::Migration[5.1]
  def change
    create_table :inbounds do |t|
      t.string :airline, null: false
      t.datetime :arrival, null: false
      t.string :arrival_formatted
      t.datetime :departure, null: false
      t.string :departure_formatted
      t.string :airport, null: false
      t.integer :travelgrouping_id
      t.string :traveller_name

      t.timestamps
    end
  end
end
