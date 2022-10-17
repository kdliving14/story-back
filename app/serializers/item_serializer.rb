class ItemSerializer < ActiveModel::Serializer
  attributes  :id, 
              :name, 
              :description, 
              :image_url,
              :event_id
end
