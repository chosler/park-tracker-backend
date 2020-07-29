class Api::V1::ParksController < ApplicationController

    def index
        parks=Park.all
        render json: parks
        # render json: ParkSerializer.new(parks)
        end

    def show
        park=Park.find(params[:id])
        render json: park
        # render json: ParkSerializer.new(park)
    end

end
