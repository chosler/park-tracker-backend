class UserParkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :park
  belongs_to :user
  belongs_to :park
end
