class Bag < ActiveRecord::Base
  belongs_to :user
  has_many :orders
end
