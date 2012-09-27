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
	
end
