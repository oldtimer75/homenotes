class Property < ActiveRecord::Base
	attr_accessible :address, :baths, :beds, :contact_email, :contact_name, :contact_phone, :notes, :price, :style
	belongs_to :user

	validates :user_id, presence: true
	validates :address, presence: true
	validates_numericality_of :contact_phone, only_integer: true, message: "can only be numbers", allow_nil: true
	validates_numericality_of :beds, only_integer: true, message: "can only be numbers", allow_nil: true
	validates_numericality_of :baths, only_integer: true, message: "can only be numbers", allow_nil: true
	validates_numericality_of :price, only_integer: true, message: "can only be numbers", allow_nil: true
end
