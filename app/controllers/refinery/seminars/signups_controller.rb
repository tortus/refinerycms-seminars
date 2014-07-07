module Refinery
  module Seminars
    class SignupsController < ::ApplicationController
      before_filter :find_seminar, :find_page, :find_all_seminars

      def new
        @signup = Signup.new(params[:signup])
        @signup.seminar = @seminar
        present(@page)
      end

      def create
        @signup = Signup.new(params[:signup])
        @signup.seminar = @seminar
        if @signup.save
          redirect_to refinery.thank_you_seminars_seminar_signups_url(@seminar)
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

        def find_page
          @page = ::Refinery::Page.where(:link_url => "/seminars").first
        end

        def find_all_seminars
          @seminars = Seminar.active.by_position
        end

    end
  end
end
