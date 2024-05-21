class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

    def create 
      user = User.find_by(email:params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

end
