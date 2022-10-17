class Userstory < ApplicationRecord
  belongs_to :user
  belongs_to :story
  has_many :userchoices, dependent: :destroy
  has_many :inventories, dependent: :destroy
end
