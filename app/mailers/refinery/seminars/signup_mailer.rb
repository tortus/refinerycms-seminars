module Refinery
  module Seminars
    class SignupMailer < ActionMailer::Base

      def confirmation(signup, request)
        @signup = signup
        mail(:subject   => "Thank you for registering!",
             :to        => signup.email,
             :from      => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to  => "info@umassfive.coop") do |format|
          format.html
          format.text
        end
      end

      def notification(signup, request)
        @signup = signup
        mail(:subject => "Seminar registration",
             :to      => "info@umassfive.coop",
             :from    => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>") do |format|
          format.html
          format.text
        end
      end

    end
  end
end
