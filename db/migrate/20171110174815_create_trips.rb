class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.decimal :budget, null: false
      t.date :start_date, null: false
      t.string :start_date_formatted
      t.date :end_date, null: false
      t.string :end_date_formatted
      t.integer :organizer_id
      t.string :organizer_name

      t.timestamps
    end
  end
end
