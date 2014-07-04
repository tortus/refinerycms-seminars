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

      validates_numericality_of :number_attending, :only_integer => true, :allow_blank => true, :greater_than_or_equal_to => 0

      validates_format_of :email, :with => /[^@]+@[^@]+/
    end
  end
end
