require 'spec_helper'

describe Property do
	let(:user) { FactoryGirl.create(:user) }

	before do 
		@property = user.properties.build(price: "100", address: "241 Toronto", style: "House", 
		beds: 1, baths: 2, contact_name: "Moe", contact_phone: 1234567890, contact_email: "blah@gmail.com", notes: "Words") 
	end

	subject { @property }

	it { should respond_to(:user_id) }
	it { should respond_to(:price) }
	it { should respond_to(:address) }
	it { should respond_to(:style) }
	it { should respond_to(:beds) }
	it { should respond_to(:baths) }
	it { should respond_to(:contact_name) }
	it { should respond_to(:contact_phone) }
	it { should respond_to(:contact_email) }
	it { should respond_to(:notes) }

	describe "when user_id is not present" do
		before { @property.user_id = nil }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Property.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end
end