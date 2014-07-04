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

  end
end
