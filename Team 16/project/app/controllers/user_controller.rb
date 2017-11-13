class UserController < BaseController
  def create
    service_handler UserService.new.method(:create_user), request.headers
  end

  def find_all
    service_handler UserService.new.method(:find_all_users)
  end

  def find_specific
    service_handler UserService.new.method(:find_user), request.headers
  end

  def delete
    raise 'not implemented'
  end
end
