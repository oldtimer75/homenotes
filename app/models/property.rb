class Property < ActiveRecord::Base
	attr_accessible :address, :baths, :beds, :contact_email, 
	:contact_name, :contact_phone, :notes, :price, :style, 
	:image, :remote_image_url, :checklist, :item_ids
	belongs_to :user
	has_and_belongs_to_many :items
	mount_uploader :image, ImageUploader
	acts_as_gmappable

	validates :user_id, presence: true
	validates :address, presence: true
	validates_numericality_of :contact_phone, only_integer: true, message: "can only be numbers", allow_nil: true
	validates_numericality_of :beds, only_integer: true, message: "can only be numbers", allow_nil: true
	validates_numericality_of :baths, only_integer: true, message: "can only be numbers", allow_nil: true
	validates_numericality_of :price, only_integer: true, message: "can only be numbers", allow_nil: true

	def gmaps4rails_address
		#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
 		self.address
	end

end
