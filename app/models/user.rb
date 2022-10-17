class User < ApplicationRecord
    has_secure_password

    validates :name, :username, :email, presence: :true
    validates :email, uniqueness: :true

    has_many :userstories, dependent: :destroy
    has_many :userchoices, through: :userstories, dependent: :destroy

    has_many :inventories, through: :userstories, dependent: :destroy
    has_many :items, through: :inventories

    has_many :stories, through: :userstories
    
    has_many :events, through: :userchoices
    has_many :choices, through: :userchoices
end
