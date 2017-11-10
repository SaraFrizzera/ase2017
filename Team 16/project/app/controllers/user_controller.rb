class UserController < ApplicationController
  def create
    service_handler UserService.new.method(:create_user), request.headers
  end

  def find
    service_handler UserService.new.method(:find_user), request.headers
  end

  def update
    raise 'not implemented'
  end

  def delete
    raise 'not implemented'
  end

  def service_handler(service_function, headers)
    render json: service_function.call(headers)
  rescue ArgumentError => exception
    render json: { error: exception.message }, status: :bad_request
  end
end
