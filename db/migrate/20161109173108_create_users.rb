class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :andrewid
      t.string :email
      t.integer :smc
      t.string :password
      t.string :password_confirmation

      t.timestamps null: false
    end
  end

  def up
    admin = User.new
    admin.first_name = "Admin"
    admin.last_name = "Admin"
    admin.email = "admin@andrew.cmu.edu"
    admin.password = "test"
    admin.password_confirmation = "test"
    admin.save!
  end

  def down
    admin = User.find_by andrewid: "admin"
    User.delete admin
  end

end
