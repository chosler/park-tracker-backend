class Api::V1::ParksController < ApplicationController

    def index
        parks=Park.all
        render json: parks
        end

    def show
        park=Park.find(params[:id])
        render json: park
    end

end
