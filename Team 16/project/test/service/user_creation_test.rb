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


#TODO REFACTORING COME SOPRA




  test 'User search' do
    reset_db

    # arrange
    creation_headers = { 'username' => 'dario', 'password' => 'pw' }
    search_headers = { 'username' => 'dario' }
    UserService.new.create_user creation_headers

    # act
    user = UserService.new.find_user search_headers

    # assert
    assert_not_equal(nil, user, 'User cant be nil after correctly searching an user')
    assert_equal(creation_headers['username'], user.username, 'Found user must be the correct one')
    assert_equal(creation_headers['password'], user.password, 'Found user must be the correct one')
  end

  test 'User search all users' do
    reset_db

    # arrange
    headers1 = { 'username' => 'dario', 'password' => 'pw' }
    headers2 = { 'username' => 'dario2', 'password' => 'pw2' }
    UserService.new.create_user headers1
    UserService.new.create_user headers2

    # act
    users = UserService.new.find_all_users

    # assert
    assert_not_equal(nil, users, 'User cant be nil after correctly searching an user')
    assert_equal(2, users.length, 'User cant be nil after correctly searching an user')
  end

  def reset_db
    User.delete_all
  end
end
