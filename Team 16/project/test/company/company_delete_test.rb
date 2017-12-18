class CompanyCreationTest < ActionDispatch::IntegrationTest
  test 'Should delete correct company when giving correct params' do
    reset_db

    # arrange
    company_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    CompanyService.new.create_company company_headers

    # act
    CompanyService.new.delete company_headers

    # assert
    assert_equal(0, Company.all.count)
  end

  def reset_db
    User.delete_all
    Company.delete_all
    User.delete_all
  end
end