class CreateOutbounds < ActiveRecord::Migration[5.1]
  def change
    create_table :outbounds do |t|
      t.string :airline, null: false
      t.datetime :arrival, null: false
      t.datetime :departure, null: false
      t.string :airport, null: false
      t.integer :travelgrouping_id

      t.timestamps
    end
  end
end
