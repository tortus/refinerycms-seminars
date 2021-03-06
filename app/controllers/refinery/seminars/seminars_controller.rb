module Refinery
  module Seminars
    class SeminarsController < ::ApplicationController

      before_filter :find_all_seminars
      before_filter :find_seminar, :only => [:show]
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @seminar in the line below:
        present(@page)
      end

      def show
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @seminar in the line below:
        present(@seminar)
      end

    protected

      def find_all_seminars
        @seminars = Seminar.active_with_future_dates.by_position.includes(:dates)
      end

      def find_seminar
        @seminar = Seminar.active_with_future_dates.find(params[:id])
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/seminars").first
      end

    end
  end
end
