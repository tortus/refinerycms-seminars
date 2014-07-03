module Refinery
  module Seminars
    class Seminar < Refinery::Core::BaseModel
      self.table_name = 'refinery_seminars'

      extend FriendlyId
      friendly_id :name, :use => :slugged

      is_seo_meta if self.table_exists?

      acts_as_indexed :fields => [:name, :content]

      attr_accessible :name, :content, :active, :position, :browser_title, :meta_description

      validates :name, :presence => true, :uniqueness => true

      def self.active
        where(:active => true)
      end

      def self.by_position
        order("#{self.table_name}.position ASC")
      end

      def self.by_name
        order("#{self.table_name}.name ASC")
      end
    end
  end
end
