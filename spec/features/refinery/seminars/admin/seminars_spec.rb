# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Seminars" do
    describe "Admin" do
      describe "seminars" do
        refinery_login_with :refinery_user

        describe "seminars list" do
          before do
            FactoryGirl.create(:seminar, :name => "UniqueTitleOne")
            FactoryGirl.create(:seminar, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.seminars_admin_seminars_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.seminars_admin_seminars_path

            click_link "Add New Seminar"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Seminars::Seminar.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Seminars::Seminar.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:seminar, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.seminars_admin_seminars_path

              click_link "Add New Seminar"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Seminars::Seminar.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:seminar, :name => "A name") }

          it "should succeed" do
            visit refinery.seminars_admin_seminars_path

            within ".actions" do
              click_link "Edit this seminar"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:seminar, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.seminars_admin_seminars_path

            click_link "Remove this seminar forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Seminars::Seminar.count.should == 0
          end
        end

      end
    end
  end
end
