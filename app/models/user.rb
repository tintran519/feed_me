class User < ActiveRecord::Base
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
  validates :location, presence: true
end
