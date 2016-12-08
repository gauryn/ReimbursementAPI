class AddReceiptImagesToReimbursements < ActiveRecord::Migration
  def change
    add_column :reimbursements, :receipt_images, :string
  end
end
