class Item < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_and_belongs_to_many :properties
  belongs_to :user

  validates :name, presence: true
end
