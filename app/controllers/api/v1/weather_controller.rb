class Api::V1::WeatherController < Api::V1::ApplicationController
  def show
    if city = Weather.where(name: params[:id]).first
      render json: city
    else
      render json: { code: "404", msg: "not found" }, status: :not_found
    end
  end
end
