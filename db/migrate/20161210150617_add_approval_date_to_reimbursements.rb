class AddApprovalDateToReimbursements < ActiveRecord::Migration
  def change
    add_column :reimbursements, :approval_date, :date
  end
end
