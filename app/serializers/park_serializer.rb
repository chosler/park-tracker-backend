class ParkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :state, :img_urls
end
