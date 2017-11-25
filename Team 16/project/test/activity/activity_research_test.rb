class ActivityResearchTest < ActionDispatch::IntegrationTest
  test 'Should find correct activity when giving correct params' do
    reset_db

    # arrange
    seed_database
    search_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }
    ActivityService.new.create_activity search_activity_headers

    # act
    activity = ActivityService.new.find_activity search_activity_headers

    # assert
    assert_not_nil(activity)
    assert_equal('dario', activity.user.username)
    assert_equal('666', activity.company.vat_number)
  end

  test 'Should find nothing when searching non existing activity' do
    reset_db

    # arrange
    seed_database
    creation_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }
    search_activity_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 20:00:00',
      'endTime' => '22 Jan 2013 22:00:00'
    }
    ActivityService.new.create_activity creation_activity_headers

    # act
    activity = ActivityService.new.find_activity search_activity_headers

    # assert
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
