class UserCreationTest < ActionDispatch::IntegrationTest
  test 'Should create correct user when giving correct params' do
    reset_db

    # arrange
    headers = { 'username' => 'dario', 'password' => 'pw' }

    # act
    user = UserService.new.create_user headers

    # assert
    assert_not_nil(user)
    assert_equal(headers['username'], user['username'])
  end

  test 'Should block user creation when giving wrong params' do
    reset_db

    # arrange
    headers1 = { 'username' => 'dario', 'password' => '' }
    headers2 = { 'username' => '', 'password' => 'pw' }

    # act & assert
    assert_raises (ArgumentError)  { UserService.new.create_user(headers1) }
    assert_raises (ArgumentError)  { UserService.new.create_user(headers2) }
  end

  test 'Should block user creation when user with same name already exists' do
    reset_db

    # arrange
    headers1 = { 'username' => 'dario', 'password' => 'a' }
    headers2 = { 'username' => 'dario', 'password' => 'pw' }

    # act & assert
    assert_not_nil(UserService.new.create_user(headers1))
    assert_raises (ArgumentError) { UserService.new.create_user(headers2) }
  end

  def reset_db
    User.delete_all
  end
end
