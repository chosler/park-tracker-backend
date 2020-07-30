class User < ApplicationRecord
    has_many :user_parks
    has_many :comments

    validates :user_name, uniqueness: true
    validates :user_name, presence: true
    validates :name, presence: true
    
    has_secure_password
end