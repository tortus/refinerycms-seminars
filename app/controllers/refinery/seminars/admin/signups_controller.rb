module Refinery
  module Seminars
    module Admin
      class SignupsController < ::Refinery::AdminController

        prepend_before_filter :find_seminar

        crudify :'refinery/seminars/signup',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => "created_at ASC",
                :sortable => false,
                :searchable => true

        def index
          # @signups = @seminar.signups.order("created_at ASC")
          if params[:date_id].present?
            @signups = @signups.where(:date_id => params[:date_id])
          end
          @signups = @signups.paginate(:page => params[:page])
        end

        private

          def find_seminar
            @seminar = Seminar.find(params[:seminar_id])
          end

          def find_all_signups
            @signups = @seminar.signups.order("created_at ASC")
          end

      end
    end
  end
end
