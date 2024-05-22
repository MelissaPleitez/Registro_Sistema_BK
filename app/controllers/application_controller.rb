class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize_user!
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  helper_method :current_user
end
