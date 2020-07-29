class User < ApplicationRecord
    has_many :user_parks
    has_many :comments
end