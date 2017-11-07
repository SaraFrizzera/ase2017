class UserService
  def create_user(username, password)
    user = User.new username: username, password: password
    #puts user.valid?
    user.save
    user
  end

  def find_user(username)
    User.find_by(username: username)
  end
end
