class Api::V1::AuthController < ApplicationController

    def login
      user = User.find_by(user_name: params[:user_name])
  
      if user && user.authenticate(params[:password])
        token = encode_token(user.id)
        render json: {user: user, token: token}
      else
        render json: {errors: "Login failed"}
      end
    end
  
    def auto_login
  
  
      if session_user
        render json: session_user
      else 
        render json: {errors: "Not a registered user"}
      end
      
    end
  end