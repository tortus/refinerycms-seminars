class CreateSeminarsDates < ActiveRecord::Migration

  def up
    create_table :refinery_seminars_dates do |t|
      t.string :name
      t.date :date
      t.integer :seminar_id
      t.boolean :full, :null => false, :default => false
      t.integer :position

      t.timestamps
    end
    add_index :refinery_seminars_dates, :seminar_id
  end

  def down
    drop_table :refinery_seminars_dates
  end

end
