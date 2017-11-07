class UserController < ApplicationController
  def create
    username = request.headers['username']
    password = request.headers['password']

    return if validate_headers([username, password])

    render json: (UserService.new.create_user username, password)
  end

  def find
    username = request.headers['username']

    return if validate_headers([username])

    render json: (UserService.new.find_user username)
  end

  def update
    raise 'not implemented'
  end

  def delete
    raise 'not implemented'
  end

  def validate_headers(headers)
    headers.each { |a| (render json: { error: 'Headers validation failed' }, status: :bad_request; return true) if a.nil? || a.empty? }
    false
  end
end
