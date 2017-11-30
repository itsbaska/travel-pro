require 'rails_helper'

describe FactoryBot do
  let(:factory)  { FactoryBot::Factory.new(:receipt) }

  it "finds a registered factory" do
    FactoryBot.register_factory(factory)
    expect(FactoryBot.factory_by_name(factory.name)).to eq factory
  end
end

RSpec.describe Receipt, type: :model do
  context "associations" do
    it { should belong_to(:purchaser) }
    it { should belong_to(:trip) }
  end

  context "model" do
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:store) }
    it { should validate_numericality_of(:total) }
  end
end

