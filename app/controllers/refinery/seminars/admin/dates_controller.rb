module Refinery
  module Seminars
    module Admin
      class DatesController < ::Refinery::AdminController

        crudify :'refinery/seminars/date',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => 'date ASC'

      end
    end
  end
end
