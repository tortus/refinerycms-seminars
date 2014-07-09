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
          if @seminar.dates.empty?
            3.times do
              @seminar.dates.build
            end
          end
        end

        def edit
          if @seminar.dates.last.try(:persisted?)
            2.times do
              @seminar.dates.build
            end
          end
        end

      end
    end
  end
end
