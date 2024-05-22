class Api::ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize_user!


    def index
      @clients = Client.all
      render json: @clients
    end

    def create
      @clients = current_user.clients.build(client_params)
        if @clients.save
            render json: @clients, status: :created
        else
            render json: { errors: @clients.errors}, status: :unprocessable_entity  
        end
    end

    def update
      if @clients.update(client_params)
        render json: @clients, status: :ok
      else
        render json: { errors: @clients.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @clients.destroy
      render json: { message: 'Client deleted successfully' }, status: :ok
    end

  
    private


    def client_params
        params.require(:client).permit(:first_name, :last_name, :client_email, :tel_number, :user_id); 
    end


end
