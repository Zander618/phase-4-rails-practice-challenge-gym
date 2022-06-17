class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  
  def show
    gym = gym_params
    render json: gym
  end

  def destroy
    gym = gym_params
    gym.destroy
    head :no_content
  end

  private

  def not_found_response
    render json: {error: "Gym not found"}, status: :not_found
  end

  def gym_params
    Gym.find_by(id: params[:id])
  end

end
