module Refinery
  module Seminars
    module Admin
      class SignupsController < ::Refinery::AdminController

        crudify :'refinery/seminars/signup',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => "created_at ASC",
                :sortable => false,
                :searchable => true

        prepend_before_filter :find_seminar

        private

          def find_seminar
            @seminar = Seminar.find(params[:seminar_id])
          end

          def find_all_signups
            @signups = @seminar.signups.order("created_at ASC")
            @signups = @signups.where(:date_id => params[:date_id]) if params[:date_id].present?
          end

      end
    end
  end
end
