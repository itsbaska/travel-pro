require 'rails_helper'

describe FactoryBot do
  let(:factory)  { FactoryBot::Factory.new(:inbound) }

  it "finds a registered factory" do
    FactoryBot.register_factory(factory)
    expect(FactoryBot.factory_by_name(factory.name)).to eq factory
  end
end

RSpec.describe Inbound, type: :model do
  context "associations" do
    it { should have_one(:traveller) }
    it { should belong_to(:travelgrouping) }
  end

  context "model" do
    it { should validate_presence_of(:airline) }
    it { should validate_presence_of(:arrival) }
    it { should validate_presence_of(:departure) }
    it { should validate_presence_of(:airport) }
  end
end
