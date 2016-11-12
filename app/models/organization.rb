class Organization < ActiveRecord::Base

	# Relations
	has_many :events
	has_many :user_orgs

	# Validations
	validates_presence_of :name, :active

	# Scopes
	scope :alphabetical, -> { order("name") }
	scope :active, -> {where('end_date is NULL')}
	scope :inactive, -> {where('end_date is not NULL')}

	# Other methods
	def make_inactive
		self.active = false
		self.save!
	end

	def make_active
		self.active = true
		self.save!
	end

end
