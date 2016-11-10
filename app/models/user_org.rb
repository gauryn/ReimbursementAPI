class UserOrg < ActiveRecord::Base

	# Relations
	belongs_to :user 
	belongs_to :organization
	has_many :reimbursements

	# Validations
	validates_inclusion_of :role, in: %w[Member Signer PContact], message: 'is not an option'
	validates_presence_of :active

	# Scope

end
