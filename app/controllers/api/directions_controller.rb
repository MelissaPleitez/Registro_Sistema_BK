class Api::DirectionsController < ApplicationController
    before_action :authorize_user!
    before_action :set_client


    def index
      @direction = @client.directions
      render json: @direction
    end

    def show
      @direction = @client.directions.find(params[:id])
      render json: @direction
    end

    def create
      @direction = @client.directions.build(direction_params)
        if @direction.save
          render json: @direction, status: :created
        else
          render json: { errors: @direction.errors }, status: :unprocessable_entity
        end
    end

    def update
    @direction = @client.directions.find(params[:id])
    if @direction.update(direction_params)
      render json: @direction, status: :ok
    else
      render json: { errors: @direction.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @direction = @client.directions.find(params[:id])
    @direction.destroy
    render json: { message: 'Direction deleted successfully' }, status: :ok
  end


    private

    def set_client
      @client = current_user.clients.find(params[:client_id])
    end
  
    def direction_params
      params.require(:direction).permit(:street, :city, :country, :client_id)
    end

end
