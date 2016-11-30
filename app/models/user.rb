class User < ActiveRecord::Base

	# Relations
	has_many :user_orgs
	has_many :reimbursements, through: :user_orgs

	# Validations
	validates_presence_of :first_name, :last_name, :andrewid
	validates_format_of :smc, with: /\A\d{4}\z/, message: "should be four digits long"
	# allow gmail.com or andrew.cmu.edu accounts only
	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|))\z/i, message: "is not a valid format"

	# Scope
	scope :alphabetical, -> {order('last_name, first_name')} 

	# Custom Methods

	# Requests for Orgs where user = member/ PContact
	def pending_requests
		return self.reimbursements.pending
	end
	def submitted_requests
		return self.reimbursements.submitted 
	end
	def approved_requests
		return self.reimbursements.approved 
	end
	# Requests for Orgs where user = signer
	def pending_requests_to_approve
		return Reimbursement.for_organization(self.organization_id)
	end

	# List of Orgs where user = Member/ PContact/ Signer
	def organizations
		orgs = []
		for uo in self.user_orgs
			orgs << uo.organization.name
		end
		return orgs
	end

	def role_in_organization (org_id)
		user_org = UserOrg.where('user_id = ? AND organization_id = ?' "#{self.id}", "#{org_id}").first
		return user_org.role
	end

	def proper_name
		first_name + " " + last_name
	end

	# ASSUME THAT SIGNER IS ALREADY A MEMBER OF ORG IN APP
	def set_signer_for_org(org_id, signer_id)
		# Ensure User is primary contact for org
		if self.role_in_organization(org_id) != 'PContact'
			return false
		else
			# Create User_Org Entry for signer
			signer_org = UserOrg.create({user_id: signer_id, organization_id: org_id, role: 'Signer', start_date: Date.today})
			return true
		end
	end

end
