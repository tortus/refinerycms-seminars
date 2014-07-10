# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Seminars" do
    describe "Admin" do
      describe "signups" do
        refinery_login_with :refinery_user

        describe "listing signups" do
          before do
            @seminar = FactoryGirl.create(:seminar)
            @date = FactoryGirl.create(:seminar_date, :seminar => @seminar)
            2.times do
              FactoryGirl.create(:seminar_signup, :seminar => @seminar, :date => @date)
            end
            visit refinery.edit_seminars_admin_seminar_path(@seminar)
            within "#date_#{@date.id}" do
              click_link "#{@date.signups.count} Sign ups"
            end
          end

          it "succeeds" do
            current_path.should == refinery.seminars_admin_seminar_signups_path(@seminar)
            page.should have_content(@date.signups.first.name)
          end
        end

        describe "viewing a signup" do
          before do
            @seminar = FactoryGirl.create(:seminar)
            @date = FactoryGirl.create(:seminar_date, :seminar => @seminar)
            @signup = FactoryGirl.create(:seminar_signup, :seminar => @seminar, :date => @date)

            visit refinery.seminars_admin_seminar_signups_path(@seminar)
            find(%(a[href="#{refinery.seminars_admin_seminar_signup_path(@seminar, @signup)}"])).click
          end

          it "succeeds" do
            current_path.should == refinery.seminars_admin_seminar_signup_path(@seminar, @signup)
            page.should have_content(@signup.email)
          end
        end

      end
    end
  end
end
