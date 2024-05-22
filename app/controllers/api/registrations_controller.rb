class Api::RegistrationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @user = User.new
    end

    def  create
        @user = User.new(registration_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: ["Invalid email or password"] }, status: :unprocessable_entity 
        end
    end
    
    private

    def registration_params
        params.require(:user).permit(:email,:username, :password, :password_confirmation);
    end
end
