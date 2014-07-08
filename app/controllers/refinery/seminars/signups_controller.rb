module Refinery
  module Seminars
    class SignupsController < ::ApplicationController
      before_filter :find_seminar, :find_all_seminars

      def new
        @page = ::Refinery::Page.find_by_path("/seminars/sign-up")
        @signup = Signup.new(:date_id => params[:date_id].to_s)
        @signup.seminar = @seminar
        present(@page)
      end

      def create
        @signup = Signup.new(params[:signup])
        @signup.seminar = @seminar
        if @signup.save_and_deliver_emails(request)
          redirect_to refinery.thank_you_seminars_seminar_signups_url(@seminar), :notice => "<p>Thank you for signing up for a complimentary seminar or workshop at UMassFive! We are committed to financial literacy so that you can make the best decisions with your money. We look forward to seeing you for <strong>#{@signup.seminar.name}: #{@signup.date.to_label}</strong>.</p>"
        else
          render :action => :new
        end
      end

      def thank_you
        @page = ::Refinery::Page.find_by_path("/seminars/thank-you")
        present(@page)
      end

      private

        def find_seminar
          @seminar = Seminar.active.find(params[:seminar_id])
        end

        def find_all_seminars
          @seminars = Seminar.active.by_position
        end

    end
  end
end
