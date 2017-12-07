class LoginController < BaseController
  def sign_in_user
    service_handler LoginService.new.method(:sign_in_user), request.headers
  end

  def log_in_user
    service_handler LoginService.new.method(:log_in_user), request.headers
  end

  def sign_in_company
    service_handler LoginService.new.method(:sign_in_company), request.headers
  end

  def log_in_company
    service_handler LoginService.new.method(:log_in_company), request.headers
  end
end
