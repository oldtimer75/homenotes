require 'spec_helper'

describe "Properties Page" do
	
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "add a property" do
		before { visit addproperty_path }

		
		describe "with valid information" do

			before do
				fill_in "property_address", 						with: "111 Ryerson Road, Oakville, Ontario"
				fill_in "property_price", 							with: "200000"
				fill_in "property_style", 							with: "Detached House"
				fill_in "property_beds", 							with: "3"
				fill_in "property_baths", 							with: "3"
				fill_in "property_contact_name", 					with: "Eric Szeto"
				fill_in "property_contact_email", 					with: "eric@gmail.com"
				fill_in "property_contact_phone", 					with: "1234567890"
				fill_in "property_notes", 							with: "test note"
				fill_in "property_remote_image_url", 				with: "http://cache.lifehacker.com/assets/images/17/2011/09/notipage.jpg"
				click_button "Submit"
			end

			it { should have_selector('title', text: user.name) }
			it { should have_selector('div.alert.alert-success', text: 'Property added!') }
			it { should have_content('Price') }
		end

		describe "with invalid information" do
			before { click_button "Submit" }

			it { should have_content('error') }
		end
	end

	describe "edit a property" do

		let!(:property) { FactoryGirl.create(:property, user: user) }
		before { visit edit_property_path(property) }

		it { should have_content('word123') }

		describe "with valid information" do

			before do
				fill_in "property_address", 						with: "111 Oakville"
				click_button "Save changes"
			end

			it { should have_selector('title', text: '111 Oakville') }
			it { should have_selector('div.alert.alert-success', text: 'Property updated.') }
		end

		describe "with invalid information" do
			before do
				fill_in "property_address", 						with: ""
				click_button "Save changes"
			end

			it { should have_content('error') }
		end

	end

end
