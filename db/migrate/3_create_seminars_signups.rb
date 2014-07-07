class CreateSeminarsSignups < ActiveRecord::Migration
  def change
    create_table :refinery_seminars_signups do |t|
      t.integer :seminar_id
      t.integer :date_id
      t.string :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :day_phone
      t.string :home_phone
      t.string :email
      t.string :member_number
      t.integer :number_attending
      t.string :guest_name
      t.string :guest_phone
      t.string :guest_email
      t.string :reminder
      t.text :comments

      t.string :number
      t.boolean :spam, :default => false, :null => false
      t.timestamps
    end
    add_index :refinery_seminars_signups, :seminar_id
    add_index :refinery_seminars_signups, :date_id
  end
end
