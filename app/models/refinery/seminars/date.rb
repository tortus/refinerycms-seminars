module Refinery
  module Seminars
    class Date < Refinery::Core::BaseModel
      self.table_name = 'refinery_seminars_dates'

      belongs_to :seminar, :class_name => 'Refinery::Seminars::Seminar', :inverse_of => :dates

      has_many :signups,  :order => 'refinery_seminars_signups.created_at ASC',
                          :class_name => 'Refinery::Seminars::Signup',
                          :inverse_of => :date

      attr_accessible :name, :date, :seminar_id, :seminar, :full, :position

      validates :name, :presence => true
      validates :date, :presence => true

      def self.by_date
        order("#{table_name}.date ASC")
      end

      def self.not_full
        where(:full => false)
      end

      def self.active
        not_full
      end

      def title
        name
      end

      def to_label
        "#{date.strftime("%A, %-m/%-d/%y")}, #{name}" if persisted?
      end
    end
  end
end
