class UserController < BaseController
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
end
