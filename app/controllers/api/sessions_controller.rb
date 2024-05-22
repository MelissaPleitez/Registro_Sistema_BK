class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

    def create 
      user = User.find_by(email:params[:email])
      if user && user.authenticate(params[:password])
        if params[:remember_me]
          cookies.permanent[:remember_token] = user.remember_token
        else
          session[:user_id] = user.id
        end
        render json: user, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

end
