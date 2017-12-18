class CompanyFunctionsTest < ActionDispatch::IntegrationTest
  test 'Should return correct user_work_amount when giving correct params' do
    reset_db

    # arrange
    company_creation_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    user_creation_headers = { 'username' => 'dario', 'password' => 'pw' }
    activity1_creation_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '22 Jan 2013 15:00:00',
      'endTime' => '22 Jan 2013 16:00:00'
    }
    activity2_creation_headers = {
      'username' => 'dario',
      'vatNumber' => '666',
      'startTime' => '23 Jan 2013 15:00:00',
      'endTime' => '23 Jan 2013 16:00:00'
    }

    company_input_headers = { 'companyName' => 'RageDarioDevelopment' }

    # act
    CompanyService.new.create_company company_creation_headers
    user = UserService.new.create_user user_creation_headers
    ActivityService.new.create_activity activity1_creation_headers
    ActivityService.new.create_activity activity2_creation_headers

    # act
    workamount = CompanyService.new.company_user_work_amount company_input_headers

    # assert
    assert_equal(1, workamount.count)
    assert_equal(user['username'], workamount.first.user)
    assert_equal(2, workamount.first.amount)
  end

  def reset_db
    User.delete_all
    Company.delete_all
    User.delete_all
  end
end
