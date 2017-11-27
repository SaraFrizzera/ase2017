class LoginService < BaseService # TODO: handle company login and sign in
  def sign_in(headers)
    UserService.new.create_user headers
  end

  def log_in(headers)
    username = headers['username']
    password = headers['password']
    validate_params([username, password])

    raise ArgumentError, 'Wrong username or password' unless User.find_by(username: username, password: password)
    true # TODO: implement hash key value to return
  end
end
