class CreateTravelgroupings < ActiveRecord::Migration[5.1]
  def change
    create_table :travelgroupings do |t|
      t.integer :trip_id
      t.integer :traveller_id

      t.timestamps
    end
  end
end
