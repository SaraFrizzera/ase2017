require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test 'Should create correct user when giving correct params' do
    reset_db

    # arrange
    headers = { 'username' => 'dario', 'password' => 'pw' }

    # act
    user = UserService.new.create_user headers

    # assert
    assert_not_equal(nil, user, 'User cant be nil after creation')
    assert_equal(headers['username'], user.username, 'Username must be correctly populated after user creation')
    assert_equal(headers['password'], user.password, 'password must be correctly populated after user creation')
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

  def reset_db
    User.delete_all
  end
end
