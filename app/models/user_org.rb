class UserOrg < ActiveRecord::Base

	# Note
	# Active field so that when new signer is elected, old signer is set to inactive. Alternative implementation: have start and end date fields instead of active field.

	# Callback
	# before_create do
	# 	if self.role == 'Signer' && active_signer_exists_for_org?
	# 		# make old signer inactive
	# 		make_old_signer_inactive
	# 	end
	# end

	# Relations
	belongs_to :user 
	belongs_to :organization
	has_many :reimbursements

	# Validations
	# validates_inclusion_of :role, in: %w[Member Signer PContact], message: 'is not an option'
	validates_date :start_date, on: :today, on: :create

	# Scope
	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	scope :organizations, -> (user_id){group()}
	# List of signers for organization
	# scope :signers_for_organization, -> (organization_id) {where('organization_id=?', organization_id)}

	# Custom Methods

	# def get_signer_for_org(organization_id)
	# 	if active_signer_exists_for_org?
	# 		return UserOrg.signers_for_organization(organization_id).active.first
	# 	end
	# 	return nil
	# end

	# private 

	# def active_signer_exists_for_org?
	# 	signers = UserOrg.signers_for_organization(self.organization_id)
	# 	if signers.count < 1
	# 		return false
	# 	else
	# 		active_signers = signers.active
	# 		return active_signers.count < 1
	# 	end
	# end

	# def make_old_signer_inactive
	# 	# Get signer + make inactive
	# 	old_signer = UserOrg.signers_for_organization(self.organization_id).active.first
	# 	old_signer.end_date = Date.today
	# 	old_signer.save!
	# end

end
