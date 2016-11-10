class Reimbursement < ActiveRecord::Base

	# Relations
	belongs_to :event
	belongs_to :user_org

	# Validations
	validates_numericality_of :total, greater_than: 0
	validates_presence_of :description
	validates_inclusion_of :status, in: %w[Pending Submitted Approved], message: "is not an option"
	validates_inclusion_of :status, in: %w[Pending Submitted], on: :create, message: 'is not an option'
	validates_date :request_date, on: :today, allow_nil: true, on: :create
	validates_date :request_date, on: :today, on: :update
	validates_date :approval_date, on: :today, allow_nil: true, on: :create
	validates_date :approval_date, on: :today, on: :update

	# Scopes

end
