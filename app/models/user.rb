class User < ActiveRecord::Base
  has_secure_password

  has_many :bags, dependent: :destroy
  has_many :hunting, class_name: "Bag", foreign_key: "hunter_id"

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
  validates :zipcode, presence: true
end
