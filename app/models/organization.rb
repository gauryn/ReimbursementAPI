class Organization < ActiveRecord::Base

	# Relations
	has_many :events
	has_many :user_orgs

	# Validations
	validates_presence_of :name, :active

	# Scopes

end
