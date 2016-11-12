class CreateUserOrgs < ActiveRecord::Migration
  def change
    create_table :user_orgs do |t|
      t.string :role
      t.date :start_date
      t.date :end_date
      t.integer :organization_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
