class UserchoiceSerializer < ActiveModel::Serializer
  attributes  :id, 
              :userstory_id, 
              :event_id, 
              :choice_id, 
              :event_description, 
              :choice_description, 
              :event_pic, 
              :choice_pic
 
  def event_description
    object.event.short_description
  end

  def event_pic
    object.event.image_url
  end

  def choice_description
    object.choice.content
  end

  def choice_pic
    object.choice.image_url
  end
end
