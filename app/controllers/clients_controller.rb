class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  
  def show
    client = client_params
    render json: client
  end

  private

  def not_found_response
    render json: {error: "Client not found"}, status: :not_found
  end

  def client_params
    Client.find_by(id: params[:id])
  end

end
