class Property < ActiveRecord::Base
	attr_accessible :address, :baths, :beds, :contact_email, :contact_name, :contact_phone, :notes, :price, :type
	belongs_to :user

	validates :user_id, presence: true
end
