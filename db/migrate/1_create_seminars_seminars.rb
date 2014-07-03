class CreateSeminarsSeminars < ActiveRecord::Migration

  def up
    create_table :refinery_seminars do |t|
      t.string :name
      t.text :content
      t.boolean :active, :null => false, :default => true
      t.integer :position
      t.string :slug

      t.timestamps
    end

    add_index :refinery_seminars, :slug
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-seminars"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/seminars/seminars"})
    end

    drop_table :refinery_seminars

  end

end
