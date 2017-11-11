class BaseController < ActionController::Base
  def service_handler(service_function, headers)
    render json: service_function.call(headers)
  rescue ArgumentError => exception
    render json: { error: exception.message }, status: :bad_request
  end

  def service_handler(service_function)
    render json: service_function.call()
  rescue ArgumentError => exception
    render json: { error: exception.message }, status: :bad_request
  end
end