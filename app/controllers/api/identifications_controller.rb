class Api::IdentificationsController < ApplicationController
    before_action :authorize_user!
    before_action :set_client

    def index
        @identification = @client.identifications
        render json: @identification
      end
  
      def show
        @identification = @client.identifications.find(params[:id])
        render json: @identification
      end
  
      def create
        @identification = @client.identifications.build(identification_params)
          if @identification.save
            render json: @identification, status: :created
          else
            render json: { errors: @identification.errors }, status: :unprocessable_entity
          end
      end
  
      def update
        @identification = @client.identifications.find(params[:id])
        if @identification.update(identification_params)
          render json: @identification, status: :ok
        else
          render json: { errors: @identification.errors }, status: :unprocessable_entity
        end
      end
    
      def destroy
        @identification = @client.identifications.find(params[:id])
        @identification.destroy
        render json: { message: 'Direction deleted successfully' }, status: :ok
      end
  
  
      private
  
      def set_client
        @client = current_user.clients.find(params[:client_id])
      end
    
      def identification_params
        params.require(:identification).permit(:identification_number, :breadcast_date, :client_id)
      end
end
