class Checklist < ActiveRecord::Base
  attr_accessible :checked, :item, :unchecked
  belongs_to :user

  validates :user_id, presence: true
end
