
namespace :db do
  desc "fill databases with sample data"
  task populate: :environment do
    make_user
    make_property
  end
end

def make_user
  admin = User.create!(name: "eric",
               email: "eric@gmail.com",
               password: "12345",
               password_confirmation: "12345")
  admin.toggle!(:admin)
end

def make_property
  users = User.first
  20.times do |n|
    price = 100000+n
    address = "#{n+1} Ryerson Street, Toronto, Ontario" 
    beds = 2+n
    baths = 3+n
    style = "House"
    contact_name = "Derek"
    contact_email = "d@gmail.com"
    contact_phone = 1234567890
    notes = "word"
    users.properties.create!(price: price, address: address, beds: beds,
       baths: baths, style: style, contact_name: contact_name, contact_email: contact_email,
        contact_phone: contact_phone, notes: notes) 
  end
end