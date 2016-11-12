class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :name
      t.string :location
      t.integer :num_of_attendees
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
