class Api::V1::UserParksController < ApplicationController

    def index
        user_parks=UserPark.all
        render json: user_parks
    end
    
end
