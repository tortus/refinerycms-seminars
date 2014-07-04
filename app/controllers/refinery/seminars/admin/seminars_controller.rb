module Refinery
  module Seminars
    module Admin
      class SeminarsController < ::Refinery::AdminController

        crudify :'refinery/seminars/seminar',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => "position ASC",
                :after_new => :build_date

        def new
          @seminar = Seminar.new
          @seminar.dates.build unless @seminar.dates.last.try(:new_record?)
        end

        def edit
          @seminar.dates.build unless @seminar.dates.last.try(:new_record?)
        end

      end
    end
  end
end
