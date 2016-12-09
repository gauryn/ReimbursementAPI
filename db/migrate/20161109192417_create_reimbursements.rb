class CreateReimbursements < ActiveRecord::Migration
  def change
    create_table :reimbursements do |t|
      t.decimal :total
      t.string :description
      t.date :request_date
      # t.string :status
      # t.date :approval_date
      t.integer :requester_id
      # t.integer :event_id
      t.date :event_date
      t.string :event_name
      t.string :event_location
      t.integer :num_of_attendees
      t.string :organization
      t.text :receipt_images

      t.timestamps null: false
    end
  end
end
