module Refinery
  module Seminars
    module Admin
      class SignupsController < ::Refinery::AdminController

        before_filter :find_seminar

        crudify :'refinery/seminars/signup',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => "created_at ASC",
                :sortable => false,
                :searchable => true

        private

          def find_seminar
            @seminar = Seminar.find(params[:seminar_id])
          end

      end
    end
  end
end
