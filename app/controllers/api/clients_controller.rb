class Api::ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize_user!


    def index
      @clients = Client.all
      render json: @clients
    end

    def show 
      @client = current_user.clients.find(params[:id])
      render json: @client, status: :ok
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
      @client = current_user.clients.find(params[:id])
      if @client.update(client_params)
        render json: @client, status: :ok
      else
        render json: { errors: @client.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @client = current_user.clients.find(params[:id])
      if @client.destroy
        render json: { message: 'Client deleted successfully' }, status: :ok
      end
    end

  
    private


    def client_params
        params.require(:client).permit(:first_name, :last_name, :client_email, :tel_number, :user_id); 
    end


end
