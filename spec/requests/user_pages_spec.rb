require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "signup_page" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Sign Up') }
		it { should have_selector('title', text: 'Sign Up') }
	end

	describe "signup" do

		before { visit signup_path }

		let(:submit)  { "Submit" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submission error test" do
	        	before { click_button submit }

	        	it { should have_selector('title', text: 'Sign Up') }
	        	it { should have_content('error') }
	        	it { should have_selector('li') }
	        end
    	end

		describe "with valid information" do
			before do
				find("input[placeholder='Name']").set "Example User"
				find("input[placeholder='Email']").set "user@example.com"
				find("input[placeholder='Password']").set "foobar"
				find("input[placeholder='Re-type Password']").set "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
			
			describe "after saving the user" do
        		before { click_button submit }
        		let(:user) { User.find_by_email('user@example.com') }

        		it { should have_selector('title', text: user.name) }
        		it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        		it { should have_link('Sign out') }
      		end
      	end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_selector('h1', text: "Update Your Account") }
			it { should have_selector('title', text: "Account") }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_name)	{ "New Name" }
			let(:new_email)	{ "new@example.com" }
			before do
				fill_in "user_name", 				with: new_name
				fill_in "user_email", 				with: new_email
				fill_in "user_password", 			with: user.password
				fill_in "user_password_confirmation", 	with: user.password
				click_button "Save changes"
			end

			it { should have_selector('title', text: new_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { user.reload.name.should == new_name }
			specify { user.reload.email.should == new_email }
		end
	end

	describe "show property listings" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit user_path(user)
		end

		describe "page" do
			it { should have_selector('h1', text: "Property Listings") }
			it { should have_selector('title', text: user.name) }
		end

		describe "with no properties" do
			it { should_not have_content('Address') }

		end

		describe "with properties" do
			let!(:property) { FactoryGirl.create(:property, user: user) }
			before { visit user_path(user) }
			it { should have_content(user.properties.count) }
			it { should have_content(property.address) }
			it { should have_content('Address') }
		end

	end



end
