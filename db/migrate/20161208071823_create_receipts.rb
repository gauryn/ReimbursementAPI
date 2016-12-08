class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :receipt_images
      t.string :reimbursement_id

      t.timestamps null: false
    end
  end
end
