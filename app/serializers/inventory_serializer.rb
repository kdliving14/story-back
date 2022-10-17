class InventorySerializer < ActiveModel::Serializer
  attributes :id, :userstory_id
  # has_one :userstory
  has_one :item
end
