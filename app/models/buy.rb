class Buy < ApplicationRecord
  belongs_to :user
  has_one :shipping_inform
  belongs_to :item
end
