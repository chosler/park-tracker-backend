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


api_key = 'bauAPLLt98R6pCK3q3BPINStflgntqKu2DLOV1Zo'
info = URI.parse("https://developer.nps.gov/api/v1/parks?api_key=#{api_key}")
response = Net::HTTP.get_response(info)
park_info = JSON.parse(response.body)

    park_info["data"].each do |park|

        name = park["fullName"]

        state= park["states"]

        activity = (park["activities"].collect do |x|
            x['name']
        end).join(', ')

        entrance_fee = (park["entranceFees"].collect do |x|
            x['cost']
        end).join(', ')

        img_url = (park["images"].collect do |x|
            x['url']
        end).join(', ')

        operating_hours = park["operatingHours"][0]["standardHours"]["monday"]

        description = park["description"]

        Park.create(name: name, state: state, activity: activity, entrance_fee: entrance_fee, img_url: img_url, operating_hours: operating_hours, description: description)
        
    end
