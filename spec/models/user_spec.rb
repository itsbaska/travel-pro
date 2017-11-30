require 'rails_helper'

describe FactoryBot do
  let(:factory)  { FactoryBot::Factory.new(:user) }

  it "finds a registered factory" do
    FactoryBot.register_factory(factory)
    expect(FactoryBot.factory_by_name(factory.name)).to eq factory
  end
end

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:trips) }
    it { should have_many(:receipts) }
    it { should have_many(:travelgroupings) }
    it { should have_many(:inbounds) }
    it { should have_many(:outbounds) }
    it { should have_many(:travel_trips) }
  end

  context "model" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:phone_number) }
  end
end


