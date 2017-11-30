require 'rails_helper'

describe User do
  let(:user) { User.new }

  describe "assocations" do
  	it { User.reflect_on_association(:travelgroupings).macro.should eq(:has_many)}
    it { User.reflect_on_association(:trips).macro.should eq(:has_many)}
    it { User.reflect_on_association(:receipts).macro.should eq(:has_many)}
    it { User.reflect_on_association(:inbounds).macro.should eq(:has_many)}
   	it { User.reflect_on_association(:outbounds).macro.should eq(:has_many)}
    it { User.reflect_on_association(:travel_trips).macro.should eq(:has_many)}
  end

  describe "full_name" do
  	it "returns back the full_name of user" do
  		user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")
  		expect(user.full_name).to eq("Victoria Luc")
  	end
  end

  describe "validations" do
		it "is valid with valid attributes" do
			user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

			expect(user).to be_valid
		end

		it "is not valid without first_name" do
			user = User.create(last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

			expect(user).to_not be_valid
		end

		it "is not valid without last_name" do
			user = User.create(first_name: "Victoria", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

			expect(user).to_not be_valid
		end

		it "is not valid without phone_number" do
			user = User.create(first_name: "Victoria", last_name: "Luc", email: "victoriajeniluc@gmail.com", password: "password")

			expect(user).to_not be_valid
		end

		it "is not valid without email" do
			user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", password: "password")

			expect(user).to_not be_valid
		end

		it "validates email uniqueness" do
			user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "vk@gmail.com", password: "password")
			user1 = User.create(first_name: "Kevin", last_name: "Luc", email: "vk@gmail.com", phone_number: "847-111-0000", password: "password")

			expect(user1).to_not be_valid
		end
  end
end
