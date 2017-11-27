class LoginController < BaseController
  def sign_in
    service_handler LoginService.new.method(:sign_in), request.headers
  end

  def log_in
    service_handler LoginService.new.method(:log_in), request.headers
  end
end
