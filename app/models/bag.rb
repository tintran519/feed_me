class Bag < ActiveRecord::Base
  belongs_to :user
  belongs_to :hunter, class_name: "User", foreign_key: "hunter_id"
  has_many :orders, dependent: :destroy
end
