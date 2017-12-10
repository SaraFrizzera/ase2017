class ActivityDeleteTest < ActionDispatch::IntegrationTest
  test 'Should delete correct activity when giving correct params' do
    reset_db

    # arrange
    seed_database
    delete_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }
    creation_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 2:00:00',
      'endTime' => '22 Jan 2013 3:00:00'
    }
    ActivityService.new.create_activity delete_activity_headers
    ActivityService.new.create_activity creation_activity_headers

    # act
    activity = ActivityService.new.delete delete_activity_headers
    remaining_activity = ActivityService.new.find_activity creation_activity_headers
    # assert
    assert_equal(1, Activity.all.length)
    assert_equal('dario', remaining_activity.user.username)
    assert_equal(Time.zone.parse(creation_activity_headers['startTime']), remaining_activity.start_time)
    assert_equal(Time.zone.parse(creation_activity_headers['endTime']), remaining_activity.end_time)
  end

  test 'Should delete nothing when the activity do not exists' do
    reset_db

    # arrange
    seed_database
    delete_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }

    # act
    activity = ActivityService.new.delete delete_activity_headers

    # assert
    assert_equal(0, Activity.all.length)
    assert_nil(activity)
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
