class Reimbursement < ActiveRecord::Base

	# Relations
	# belongs_to :event
	# belongs_to :user_org
	# belongs_to :organization

	# Reimbursement Validations
	validates_numericality_of :total, greater_than: 0
	validates_presence_of :description
	# validates_inclusion_of :status, in: %w[Pending Submitted Approved], message: "is not an option"
	# validates_inclusion_of :status, in: %w[Pending Submitted], on: :create, message: 'is not an option'
	validates_date :request_date, on: :today, allow_nil: true, on: :create
	validates_date :request_date, on: :today, on: :update
	validates_date :approval_date, on: :today, allow_nil: true, on: :create
	validates_date :approval_date, on: :today, on: :update
	# Event Validation
	validates_presence_of :event_location, :event_name, :organization
	validates_date :event_date, on_or_before: :today
	validates_numericality_of :num_of_attendees
	# validate :organization_is_active

	# Scopes
	scope :chronological, -> { order("request_date") }
	scope :chronological_approval, -> {order('approval_date')}
	scope :order_total_descending, -> {order('total DESC')}
	# Order By Event
	scope :by_event, -> {joins(:event).order('name')}
	# Status of Reimbursement Request
	scope :pending, -> {where(status: 'Pending')}
	scope :submitted, -> {where(status: 'Submitted')}
	scope :approved, -> {where(status: 'Approved')}
	# For events, users, orgs
	scope :for_event, ->(event_id) { where('event_id = ?', event_id) }
	scope :for_user, -> (user_id) { joins(:user_org).where('user_id = ?', user_id) }
	scope :for_organization, -> (organization_id) {joins(:event).where('organization_id = ?', organization_id)}

	# Methods

	# signer for particular request
	def get_signer_info
		signers_for_org = UserOrg.signers_for_organization(self.user_org.organization_id)
		for s in signers_for_org
			if self.approval_date >= s.start_date and self.approval_date <= s.end_date
				return s 
			end
		end
		return nil
	end

	def approve
		if !check_if_authorized?
			return false
		end
		self.approval_date = Date.now()
		self.status = 'Approved'
		self.save!
		return true
	end

	private
	def check_if_authorized?
		user_org = UserOrg.find(self.user_org_id)
		if user_org.role == 'Signer'
			return true
		end
		return false
	end

	def organization_is_active
		all_current_orgs = Organization.active.to_a.map{|o| o.id}
	    unless all_current_organizations.include?(self.organization_id)
	      errors.add(:organization_id, "is not an active organization")
	    end
	end

end
