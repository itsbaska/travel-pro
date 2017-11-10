class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.decimal :budget, null: false
      t.integer :organizer_id

      t.timestamps
    end
  end
end
