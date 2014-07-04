# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Seminars" do
    describe "Admin" do
      describe "dates" do
        refinery_login_with :refinery_user

        describe "dates list" do
          before do
            @seminar = FactoryGirl.create(:seminar)
            @date = FactoryGirl.create(:seminar_date, :seminar => @seminar)
          end

          it "shows two items" do
            visit refinery.seminars_admin_seminar_path(@seminar)
            page.should have_content(@date.name)
          end
        end

        # describe "create" do
        #   before do
        #     visit refinery.seminars_admin_dates_path

        #     click_link "Add New Seminar Date"
        #   end

        #   context "valid data" do
        #     it "should succeed" do
        #       fill_in "Name", :with => "This is a test of the first string field"
        #       click_button "Save"

        #       page.should have_content("'This is a test of the first string field' was successfully added.")
        #       Refinery::Seminars::Date.count.should == 1
        #     end
        #   end

        #   context "invalid data" do
        #     it "should fail" do
        #       click_button "Save"

        #       page.should have_content("Name can't be blank")
        #       Refinery::Seminars::Date.count.should == 0
        #     end
        #   end

        #   context "duplicate" do
        #     before { FactoryGirl.create(:date, :name => "UniqueTitle") }

        #     it "should fail" do
        #       visit refinery.seminars_admin_dates_path

        #       click_link "Add New Seminar Date"

        #       fill_in "Name", :with => "UniqueTitle"
        #       click_button "Save"

        #       page.should have_content("There were problems")
        #       Refinery::Seminars::Date.count.should == 1
        #     end
        #   end

        # end

        # describe "edit" do
        #   before { FactoryGirl.create(:date, :name => "A name") }

        #   it "should succeed" do
        #     visit refinery.seminars_admin_dates_path

        #     within ".actions" do
        #       click_link "Edit this seminar date"
        #     end

        #     fill_in "Name", :with => "A different name"
        #     click_button "Save"

        #     page.should have_content("'A different name' was successfully updated.")
        #     page.should have_no_content("A name")
        #   end
        # end

        # describe "destroy" do
        #   before { FactoryGirl.create(:date, :name => "UniqueTitleOne") }

        #   it "should succeed" do
        #     visit refinery.seminars_admin_dates_path

        #     click_link "Remove this seminar date forever"

        #     page.should have_content("'UniqueTitleOne' was successfully removed.")
        #     Refinery::Seminars::Date.count.should == 0
        #   end
        # end

      end
    end
  end
end
