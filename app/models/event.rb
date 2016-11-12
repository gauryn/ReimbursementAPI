class Event < ActiveRecord::Base

	# Relations
	belongs_to :organization
	has_many :reimbursements

	# Validations
	validates_presence_of :location, :name
	validates_date :event_date, on_or_before: :today
	validates_numericality_of :num_of_attendees
	validate :organization_is_active

	# Scopes
	scope :alphabetical, -> { order('name') }
	scope :chronological, -> { order('event_date')}
	# For organizations
	scope :for_organization, ->(organization_id) { where('organization_id = ?', organization_id) }

	# Private Methods
	private 
	def organization_is_active
		all_current_orgs = Organization.active.to_a.map{|o| o.id}
	    unless all_current_organizations.include?(self.organization_id)
	      errors.add(:organization_id, "is not an active organization")
	    end
	end

end
