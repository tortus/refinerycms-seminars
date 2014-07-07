module Refinery
  module Seminars
    class Signup < ActiveRecord::Base

      belongs_to :seminar, :class_name => 'Refinery::Seminars::Seminar', :inverse_of => :signups
      belongs_to :date, :class_name => 'Refinery::Seminars::Date', :inverse_of => :signups

      attr_accessible :address1, :address2, :city, :comments, :date_id, :day_phone, :email, :first_name, :guest_email, :guest_name, :guest_phone, :home_phone, :last_name, :member_number, :middle_name, :number_attending, :prefix, :reminder, :seminar_id, :state, :suffix, :zipcode

      validates_length_of :address1, :address2, :city, :comments, :date_id, :day_phone,
        :email, :first_name, :guest_email, :guest_name, :guest_phone, :home_phone, :last_name,
        :member_number, :middle_name, :prefix, :reminder, :seminar_id, :state, :suffix, :zipcode,
        :maximum => 255
      validates_length_of :comments, :maximum => 2000

      validates_presence_of :first_name, :last_name, :address1, :city, :state, :zipcode,
        :day_phone, :home_phone, :email, :reminder

      validates_numericality_of :number_attending, :only_integer => true, :allow_blank => true,
        :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10

      validates_format_of :email, :with => /[^@]+@[^@]+/

      validates_inclusion_of :reminder, :in => lambda {|signup| signup.options_for_reminder}

      validate :seminar_must_be_active
      validate :date_must_not_be_full

      def options_for_date
        seminar.dates.active.map {|date|
          [date.to_label, date.id]
        }
      end

      def options_for_prefix
        %w[Mr. Mrs. Ms. Miss. Dr.]
      end

      def options_for_suffix
        %w[Sr. Jr. Esq.]
      end

      def options_for_state
        State.options
      end

      def options_for_number_attending
        (1..10).to_a
      end

      def options_for_reminder
        ["Email", "Phone call", "Both"]
      end

      private

        def seminar_must_be_active
          unless seminar.present? && seminar.active?
            errors.add(:seminar_id, "must be active")
          end
        end

        def date_must_not_be_full
          unless date.present? && !date.full?
            errors.add(:date_id, "must not be full")
          end
        end
    end
  end
end
