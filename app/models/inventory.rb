class Inventory < ApplicationRecord
  belongs_to :userstory
  belongs_to :item

  has_one :user, through: :userstory
end
