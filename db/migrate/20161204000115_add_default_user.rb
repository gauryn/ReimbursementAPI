class AddDefaultUser < ActiveRecord::Migration

	def up
		admin = User.new
		admin.first_name = "Admin"
		admin.last_name = "Admin"
		admin.email = "admin@andrew.cmu.edu"
		admin.andrewid = "admin"
		admin.smc = 1234
		admin.password = "test"
		admin.password_confirmation = "test"
		admin.save!
	end

	def down
		admin = User.find_by andrewid: "admin"
		User.delete admin
	end

end
