class UserService
  def create_user(username, password)
    validate_params([username, password])

    user = User.new username: username, password: password
    user.save
    user
  end

  def find_user(username)
    validate_params([username])

    User.find_by(username: username)
  end

  def validate_params(params)
    params.each { |a| raise ArgumentError, 'Headers validation failed' if a.nil? || a.empty? }
    false
  end
end
