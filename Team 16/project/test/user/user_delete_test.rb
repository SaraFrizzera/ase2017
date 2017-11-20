class UserDeleteTest < ActionDispatch::IntegrationTest
  test 'Should delete correct user when giving correct params' do
    reset_db

    # arrange
    creation_headers1 = { 'username' => 'dario', 'password' => 'pw' }
    creation_headers2 = { 'username' => 'dario2', 'password' => 'pw' }
    delete_headers = { 'username' => 'dario' }
    UserService.new.create_user creation_headers1
    UserService.new.create_user creation_headers2

    # act
    UserService.new.delete_user delete_headers

    # assert
    assert_nil(UserService.new.find_user(creation_headers1))
    assert_not_nil(UserService.new.find_user(creation_headers2))
  end

  test 'Should delete nothing when user is not in db' do
    reset_db

    # arrange
    creation_headers1 = { 'username' => 'dario', 'password' => 'pw' }
    creation_headers2 = { 'username' => 'dario2', 'password' => 'pw' }
    delete_headers = { 'username' => 'dario3' }
    UserService.new.create_user creation_headers1
    UserService.new.create_user creation_headers2

    # act
    UserService.new.delete_user delete_headers

    # assert
    assert_not_nil(UserService.new.find_user(creation_headers1))
    assert_not_nil(UserService.new.find_user(creation_headers2))
  end

  def reset_db
    User.delete_all
  end
end
