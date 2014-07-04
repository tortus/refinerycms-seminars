module Refinery
  module Seminars
    module Admin
      class DatesController < ::Refinery::AdminController

        before_filter :find_seminar
        before_filter :find_date, :only => [:edit, :update, :destroy]

        def new
          @date = Date.new(:seminar => @seminar)
        end

        def edit
        end

        def update
          @date.attributes = params[:date]
          @date.seminar = @seminar
          if @date.save
            redirect_to refinery.seminars_admin_edit_seminar_url(@seminar), :notice => "Date was successfully updated."
          else
            render :action => :edit
          end
        end

        def destroy
          @date.destroy
          redirect_to refinery.seminars_admin_edit_seminar_url(@seminar), :notice => "Date was successfully deleted."
        end

        private

          def find_seminar
            @seminar = Seminar.find(params[:seminar_id])
          end

          def find_date
            @date = @seminar.dates.find(params[:id])
          end

      end
    end
  end
end
