module Refinery
  module Seminars
    class Seminar < Refinery::Core::BaseModel
      self.table_name = 'refinery_seminars'

      has_many :dates,  :order => 'refinery_seminars_dates.date ASC',
                        :dependent => :destroy,
                        :class_name => 'Refinery::Seminars::Date',
                        :inverse_of => :seminar

      has_many :signups,  :dependent => :restrict,
                          :class_name => 'Refinery::Seminars::Signup',
                          :inverse_of => :seminar,
                          :order => 'refinery_seminars_signups.created_at ASC'

      extend FriendlyId
      friendly_id :name, :use => :slugged

      is_seo_meta if self.table_exists?

      acts_as_indexed :fields => [:name, :content]

      accepts_nested_attributes_for :dates
      attr_accessible :name, :content, :active, :position, :browser_title, :meta_description, :dates_attributes

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
