class Api::V1::UserParksController < ApplicationController

    def index
        user_parks=UserPark.all
        options = {
            include: [:user, :park]
        }
        render json: UserParkSerializer.new(user_parks)
    end

    # def show
    #     user_park = UserPark.find(params[:id])
    #     render json: user_park
    #     render json: ParkSerializer.new(park)
    # end
    
    def create
        user_park = UserPark.new(user_park_params)
        user_park.save!
        options = {include: [:user, :park]}
        render json: UserParkSerializer.new(user_park)
    end

    def destroy
        user_park = UserPark.find(params[:id])
        user_park.destroy!
        options = {include: [:user, :park]}
        render json: UserParkSerializer.new(user_park)
    end

    private

    def user_park_params
        params.require(:user_park).permit(:user_id, :park_id)
    end
end
