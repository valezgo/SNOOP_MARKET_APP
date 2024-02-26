class Purchaseditem < ApplicationRecord
  belongs_to :item
  belongs_to :purchase
end
