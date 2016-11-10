class User < ActiveRecord::Base

	# Relations
	has_many :user_orgs
	has_many :reimbursements, through: :user_orgs

	# Validations
	validates_presence_of :first_name, :last_name, :andrewID
	validates_format_of :smc, with: /\A\d{4}\z/, message: "should be four digits long"
	# allow gmail.com or andrew.cmu.edu accounts only
	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|))\z/i, message: "is not a valid format"

	# Scope

end
