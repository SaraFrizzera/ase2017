class CompanyResearchTest < ActionDispatch::IntegrationTest
  test 'Should fnd correct company when giving correct params' do
    reset_db

    # arrange
    creation_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    research_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    created_company = CompanyService.new.create_company creation_headers

    # act
    company = CompanyService.new.find_company research_headers

    # assert
    assert_not_nil(company)
    assert_equal(created_company, company)
    assert_equal(creation_headers['companyName'], company.company_name)
  end

  def reset_db
    User.delete_all
    Company.delete_all
    User.delete_all
  end
end
