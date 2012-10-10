require 'spec_helper'

describe "StaticPages" do

	it "should have the right links in the layout" do
	    visit root_path
	    click_link "Contact Us"
	    page.should have_selector 'title', text: full_title('Contact Us')
	    click_link "Sign in"
	    page.should have_selector 'title', text: full_title('Sign in')
	    click_link "HomeNotes"
  		page.should have_link "Sign up!"
	end  
	
	describe "contact form" do
		subject { page }
		before {visit contact_path}

		before do
			fill_in "message_name", 				with: "Derek"
			fill_in "message_email", 				with: "derekgmail.com"
			fill_in "message_subject", 				with: "test subject"
			click_button "Send"
		end

		it { should have_selector('div.alert.alert-alert', text: "fill") }

		describe "valid sent message" do

			before do
				fill_in "message_name", 				with: "Derek"
				fill_in "message_email", 				with: "derek@gmail.com"
				fill_in "message_subject", 				with: "test subject"
				fill_in "message_body", 				with: "test message"
				click_button "Send"
			end

			it { should have_selector('div.alert.alert-notice', text: "sent") }
		end
	end
end
