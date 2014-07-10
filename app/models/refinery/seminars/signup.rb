module Refinery
  module Seminars
    class Signup < ActiveRecord::Base

      belongs_to :seminar, :class_name => 'Refinery::Seminars::Seminar', :inverse_of => :signups
      belongs_to :date, :class_name => 'Refinery::Seminars::Date', :inverse_of => :signups

      delegate :name, :to => :seminar, :prefix => true, :allow_nil => true

      attr_accessible :address1, :address2, :city, :comments, :date_id, :day_phone, :email, :first_name, :guest_email, :guest_name, :guest_phone, :home_phone, :last_name, :member_number, :middle_name, :number_attending, :prefix, :reminder, :seminar_id, :state, :suffix, :zipcode

      validates_length_of :address1, :address2, :city, :comments, :date_id, :day_phone,
        :email, :first_name, :guest_email, :guest_name, :guest_phone, :home_phone, :last_name,
        :member_number, :middle_name, :prefix, :reminder, :seminar_id, :state, :suffix, :zipcode,
        :maximum => 255
      validates_length_of :comments, :maximum => 2000

      validates_presence_of :first_name, :last_name, :day_phone, :email

      validates_numericality_of :number_attending, :only_integer => true, :allow_blank => true,
        :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10

      validates_format_of :email, :with => /[^@]+@[^@]+/

      # validates_inclusion_of :reminder, :in => lambda {|signup| signup.options_for_reminder}

      validate :seminar_must_be_active
      validate :date_must_not_be_full
      validate :date_must_be_current

      acts_as_indexed :fields => [:first_name, :last_name, :day_phone, :email, :guest_name]

      def save_and_deliver_emails(request)
        if result = self.save
          SignupMailer.confirmation(self, request).deliver
          SignupMailer.notification(self, request).deliver
        end
        result
      end

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

      def name
        [first_name, middle_name, last_name].reject(&:blank?).map(&:strip).join(" ")
      end

      def title
        "#{seminar_name} Sign Up"
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

        def date_must_be_current
          unless date.present? && date.current?
            errors.add(:date_id, "must be current")
          end
        end

    end
  end
end
