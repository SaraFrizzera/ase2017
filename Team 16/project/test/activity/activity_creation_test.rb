require 'date'

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
    assert_equal(Time.zone.parse(headers['startTime']), activity.start_time)
    assert_equal(Time.zone.parse(headers['endTime']), activity.end_time)
  end

  def reset_db
    Activity.delete_all
  end
end
