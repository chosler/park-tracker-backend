# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "uri"
require "net/http"

Park.destroy_all
User.destroy_all
UserPark.destroy_all
Comment.destroy_all

start=0

while start <= 500
api_key = 'bauAPLLt98R6pCK3q3BPINStflgntqKu2DLOV1Zo'
info = URI.parse("https://developer.nps.gov/api/v1/parks?start=#{start}&api_key=#{api_key}")
response = Net::HTTP.get_response(info)
park_info = JSON.parse(response.body)

start = start + 50

park_info["data"].each do |park|
    
    if park["designation"] == "National Park" 

            name = park["fullName"]

            state= park["states"]

            activity = (park["activities"].collect do |x|
                x['name']
            end).join(', ')

            entrance_fee = (park["entranceFees"].collect do |x|
                x['cost']
            end).join(', ')

            img_urls = (park["images"].collect do |x|
                x['url']
            end)

            operating_hours = park["operatingHours"][0]["standardHours"]["monday"]

            description = park["description"]

            lat = park["latitude"].to_f

            long = park["longitude"].to_f

            Park.create(name: name, state: state, activity: activity, entrance_fee: entrance_fee, img_urls: img_urls, operating_hours: operating_hours, description: description, lat: lat, long: long)
        
        end
    end
end

User.create(name: 'Pikachu', profile_pic:'https://i.guim.co.uk/img/media/dd703cd39013271a45bc199fae6aa1ddad72faaf/0_0_2000_1200/master/2000.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=178a9434c272d5a067353f57a30f58ed')
User.create(name: 'Woody', profile_pic:'https://vignette.wikia.nocookie.net/disney/images/2/22/Profile_-_Woody.jpeg/revision/latest?cb=20200711052417')

UserPark.create(user_id: 1, park_id: 1)
UserPark.create(user_id: 1, park_id: 2)
UserPark.create(user_id: 1, park_id: 3)
UserPark.create(user_id: 1, park_id: 4)
UserPark.create(user_id: 2, park_id: 8)
UserPark.create(user_id: 2, park_id: 6)

