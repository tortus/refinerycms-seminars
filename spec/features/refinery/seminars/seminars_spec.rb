# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Seminars" do

    describe "listing active seminars" do
      before do
        @seminar = FactoryGirl.create(:seminar)
        visit refinery.seminars_seminars_path
      end
      it "shows the active seminars" do
        page.should have_content(@seminar.name)
      end
    end

    describe "viewing a seminar" do
      before do
        @seminar = FactoryGirl.create(:seminar, :name => "MySeminar", :content => "TestContentHere")
        visit refinery.seminars_seminar_path(@seminar)
      end
      it "shows the seminar" do
        page.should have_content(@seminar.name)
        page.should have_content(@seminar.content)
      end
    end

    describe "signing up for a seminar" do
      before do
        @seminar = FactoryGirl.create(:seminar)
        @date = FactoryGirl.create(:seminar_date, :seminar => @seminar)
        visit refinery.seminars_seminars_path
        click_link "Register now"
      end

      context "with valid data" do
        it "succeeds" do
          fill_in "First name", :with => "Test"
          fill_in "Last name", :with => "Testerson"
          fill_in "Address", :with => "123 Test St."
          fill_in "City", :with => "Amherst"
          fill_in "State", :with => "Massachusetts"
        end
      end

      # context "with invalid data" do
      #   it "shows an error message" do
      #     pending
      #   end
      # end
    end

  end
end
