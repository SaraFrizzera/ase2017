class LoginService < BaseService # TODO: handle company login and sign in
  def sign_in(headers)
    UserService.new.create_user headers
  end

  def log_in(headers)
    username = headers['username']
    password = headers['password']
    validate_params([username, password])

    user = User.find_by(username: username, password: password)
    raise ArgumentError, 'Wrong username or password' unless user
    user
  end
end