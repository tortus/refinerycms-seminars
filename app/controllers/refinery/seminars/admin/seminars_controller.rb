module Refinery
  module Seminars
    module Admin
      class SeminarsController < ::Refinery::AdminController

        crudify :'refinery/seminars/seminar',
                :title_attribute => 'name',
                :paging => false,
                :order => "position ASC"

        def new
          @seminar = Seminar.new
          if @seminar.dates.empty?
            3.times do
              @seminar.dates.build
            end
          end
        end

        def edit
          if @seminar.dates.last.try(:persisted?) || @seminar.dates.blank?
            2.times do
              @seminar.dates.build
            end
          end
        end

      end
    end
  end
end
