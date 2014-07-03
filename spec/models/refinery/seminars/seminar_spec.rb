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
    end
  end
end
