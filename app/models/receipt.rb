class Receipt < ActiveRecord::Base

	# Relationship
	belongs_to :reimbursement

	# Receipts Uploader
	mount_uploader :receipt_images, ReceiptImagesUploader
end
