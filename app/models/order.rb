class Order < ActiveRecord::Base
  belongs_to :bag
  belongs_to :food
end
