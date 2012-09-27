require 'spec_helper'

describe "UserPages" do

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

end