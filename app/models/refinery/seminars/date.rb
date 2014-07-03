module Refinery
  module Seminars
    class Date < Refinery::Core::BaseModel
      self.table_name = 'refinery_seminars_dates'

      belongs_to :seminar, :class_name => 'Refinery::Seminars::Seminar', :inverse_of => :dates

      attr_accessible :name, :date, :seminar_id, :full, :position

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
    end
  end
end
