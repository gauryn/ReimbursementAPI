class AddDefaultReimbursement < ActiveRecord::Migration
	
	def up
		r = Reimbursement.new
		r.total = 20.0
		r.description = "Test"
		r.request_date = Date.today()
		r.requester_id = 1
		r.event_date = Date.today()
		r.event_name = "Test Event"
		r.event_location = "Rangos"
		r.num_of_attendees = 20
		r.organization = "OM"
		r.save!
	end

	def down
		r = Reimbursement.find_by id: 1
		Reimbursement.delete r
	end

end
