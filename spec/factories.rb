FactoryGirl.define do
  factory :user do
    sequence(:name)		{ |n| "Person #{n}" }
    sequence(:email)	{ |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  
  	factory :admin do
  		admin true
  	end
  end

  factory :property do
  	user
  	price 1000
  	sequence(:address)		{ |n| "#{n} Street" }
  	beds 2
  	baths 3
    style "House"
    contact_name "Derek"
    contact_email "d@gmail.com"
    contact_phone 1234567890
    notes "word"
	end
end