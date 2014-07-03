module Refinery
  module Seminars
    module Admin
      class SeminarsController < ::Refinery::AdminController

        crudify :'refinery/seminars/seminar',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => "position ASC"

      end
    end
  end
end
