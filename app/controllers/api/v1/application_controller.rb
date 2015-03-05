class Api::V1::ApplicationController < ApplicationController
  before_action do
    if params[:token] != Settings.token
      render json: { code: 403, msg: "forbidden" }, status: :forbidden
    end
  end
end
