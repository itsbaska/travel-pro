require 'rails_helper'

describe Travelgrouping do
  let(:travelgrouping) { Travelgrouping.new }

  describe "assocations" do 
  	it { Travelgrouping.reflect_on_association(:trip).macro.should eq(:belongs_to)}
    it { Travelgrouping.reflect_on_association(:outbounds).macro.should eq(:has_many)}
    it { Travelgrouping.reflect_on_association(:inbounds).macro.should eq(:has_many)}
    it { Travelgrouping.reflect_on_association(:traveller).macro.should eq(:belongs_to)}
  end 
end 