class ActivityCreationTest < ActionDispatch::IntegrationTest
  test 'Should create correct activity when giving correct params' do
    reset_db

    # arrange
    headers = { 'startTime' => '22 Jan 2013 15:00:00', 'endTime' => '22 Jan 2013 16:00:00' }

    # act
    activity = ActivityService.new.create_activity headers

    # assert
    assert_not_nil(activity)
    assert_equal(headers['startTime'], activity.start_time)
    assert_equal(headers['endTime'], activity.end_time)
  end

  def reset_db
    Activity.delete_all
  end
end
