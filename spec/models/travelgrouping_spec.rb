require 'rails_helper'

describe FactoryBot do
  let(:factory)  { FactoryBot::Factory.new(:travelgrouping) }

  it "finds a registered factory" do
    FactoryBot.register_factory(factory)
    expect(FactoryBot.factory_by_name(factory.name)).to eq factory
  end
end

RSpec.describe Travelgrouping, type: :model do
  context "associations" do
    it { should have_many(:inbounds) }
    it { should have_many(:outbounds) }
    it { should belong_to(:traveller) }
    it { should belong_to(:trip) }
  end
end


# describe Travelgrouping do
#   let(:travelgrouping) { Travelgrouping.new }

#   describe "associations" do
#   	it { Travelgrouping.reflect_on_association(:trip).macro.should eq(:belongs_to)}
#     it { Travelgrouping.reflect_on_association(:outbounds).macro.should eq(:has_many)}
#     it { Travelgrouping.reflect_on_association(:inbounds).macro.should eq(:has_many)}
#     it { Travelgrouping.reflect_on_association(:traveller).macro.should eq(:belongs_to)}
#   end
# end
