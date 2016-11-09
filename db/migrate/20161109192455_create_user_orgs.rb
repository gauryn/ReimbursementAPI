class CreateUserOrgs < ActiveRecord::Migration
  def change
    create_table :user_orgs do |t|
      t.string :role
      t.boolean :active
      t.integer :org_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
