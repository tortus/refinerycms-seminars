require 'spec_helper'

module Refinery
  module Seminars
    describe Seminar do
      subject { FactoryGirl.build(:seminar) }

      describe "validations" do
        it { should be_valid }
        its(:errors) { should be_empty }
      end

      it "saves" do
        subject.save!.should be_truthy
      end

      describe "'active' scope" do
        it "includes active seminars" do
          seminar = FactoryGirl.create(:seminar, :active)
          Seminar.active.should include(seminar)
        end
      end

      describe "'active_with_future_dates' scope" do
        it "includes active seminars with active dates" do
          seminar = FactoryGirl.create(:seminar, :active)
          FactoryGirl.create(:seminar_date, :active, :seminar => seminar)
          Seminar.active_with_future_dates.should include(seminar)
        end
        it "includes active seminars with full future dates" do
          seminar = FactoryGirl.create(:seminar, :active)
          FactoryGirl.create(:seminar_date, :seminar => seminar, :full => true, :date => ::Date.today + 1.day)
          Seminar.active_with_future_dates.should include(seminar)
        end
        it "doesn't include active seminars without any future dates" do
          seminar = FactoryGirl.create(:seminar, :active)
          date = FactoryGirl.create(:seminar_date, :seminar => seminar, :date => ::Date.today - 1.day)
          Seminar.active_with_future_dates.should_not include(seminar)
        end
      end
    end
  end
end
