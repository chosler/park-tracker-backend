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

            Park.create(name: name, state: state, activity: activity, entrance_fee: entrance_fee, img_urls: img_urls, operating_hours: operating_hours, description: description)
        
        end
    end
end
