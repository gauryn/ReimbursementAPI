class Event < ActiveRecord::Base

	# Relations
	belongs_to :organization
	has_many :reimbursements

	# Validations
	validates_presence_of :location
	validates_date :event_date, on_or_before: :today
	validates_numericality_of :num_of_attendees

	# Scopes

end
