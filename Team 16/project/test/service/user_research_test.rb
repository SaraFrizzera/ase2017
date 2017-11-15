class UserResearchTest < ActionDispatch::IntegrationTest
  test 'Should find correct user when giving correct params' do
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

  test 'Should find all users when giving correct params' do
    reset_db

    # arrange
    creation_headers1 = { 'username' => 'dario', 'password' => 'pw' }
    creation_headers2 = { 'username' => 'dario', 'password' => 'pw' }
    UserService.new.create_user creation_headers1
    UserService.new.create_user creation_headers2
    # act
    users = UserService.new.find_all_users

    # assert
    assert_not_equal(nil, users)
    assert_not_equal(nil, users)
  end

  def reset_db
    User.delete_all
  end
end
