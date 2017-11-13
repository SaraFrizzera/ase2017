class BaseController < ActionController::Base
  def service_handler(service_function, headers = nil)
    (render json: service_function.call; return) if headers.nil?
    render json: service_function.call(headers)
  rescue ArgumentError => exception
    render json: { error: exception.message }, status: :bad_request
  end
end