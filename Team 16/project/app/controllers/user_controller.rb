class UserController < ApplicationController
  def create
    username = request.headers['username']
    password = request.headers['password']

    begin
      render json: (UserService.new.create_user username, password)
    rescue ArgumentError => exception
      render json: { error: exception.message }, status: :bad_request
    end
  end

  def find
    username = request.headers['username']

    begin
      render json: (UserService.new.find_user username)
    rescue ArgumentError => exception
      render json: { error: exception.message }, status: :bad_request
    end
  end

  def update
    raise 'not implemented'
  end

  def delete
    raise 'not implemented'
  end
end
