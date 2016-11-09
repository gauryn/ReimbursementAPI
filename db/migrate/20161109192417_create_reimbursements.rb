class CreateReimbursements < ActiveRecord::Migration
  def change
    create_table :reimbursements do |t|
      t.double :total
      t.string :description
      t.date :request_date
      t.string :status
      t.date :approval_date
      t.integer :requester_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
