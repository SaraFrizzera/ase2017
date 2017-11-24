class ActivityCreationTest < ActionDispatch::IntegrationTest
  test 'Should create correct activity when giving correct params' do
    reset_db

    # arrange
    user_headers = { 'username' => 'dario', 'password' => 'pw' }
    company_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }

    user = UserService.new.create_user user_headers
    company = CompanyService.new.create_company company_headers

    # act
    activity = ActivityService.new.create_activity activity_headers

    # assert
    assert_not_nil(activity)
    assert_equal(Time.zone.parse(activity_headers['startTime']), activity.start_time)
    assert_equal(Time.zone.parse(activity_headers['endTime']), activity.end_time)
    assert_equal(user, activity.user)
    assert_equal(user.username, activity.user.username)
    assert_equal(company, activity.company)
    assert_equal(company.vat_number, activity.company.vat_number)
    assert_equal(1, ((activity.end_time - activity.start_time) / 1.hour).round)
    assert_equal(60, ((activity.end_time - activity.start_time) / 1.minute).round)
  end

  test 'Should stop activity creation when user not existing' do
    reset_db

    # arrange
    seed_database
    wrong_activity_headers = {
      'username' => 'dario2',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }

    # act & assert
    assert_raises (ArgumentError) { ActivityService.new.create_activity wrong_activity_headers }
  end

  test 'Should stop activity creation when company not existing' do
    reset_db

    # arrange
    seed_database
    wrong_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '0',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }

    # act & assert
    assert_raises (ArgumentError) { ActivityService.new.create_activity wrong_activity_headers }
  end

  def reset_db
    Activity.delete_all
    Company.delete_all
    User.delete_all
  end

  def seed_database
    user_headers = { 'username' => 'dario', 'password' => 'pw' }
    company_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }

    UserService.new.create_user user_headers
    CompanyService.new.create_company company_headers
  end
end
