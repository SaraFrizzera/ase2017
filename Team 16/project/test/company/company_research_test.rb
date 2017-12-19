class CompanyResearchTest < ActionDispatch::IntegrationTest
  test 'Should find correct company when giving correct params' do
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

  test 'Should find correct company when giving correct id' do
    reset_db

    # arrange
    creation_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    research_headers = { 'id' => '3' }
    created_company = CompanyService.new.create_company creation_headers

    # act
    company = CompanyService.new.find_company_by_id research_headers

    # assert
    assert_not_nil(company)
    assert_equal(created_company, company)
    assert_equal(creation_headers['companyName'], company.company_name)
  end

  test 'Should find all companies' do
    reset_db

    # arrange
    creation_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }
    created_company = CompanyService.new.create_company creation_headers

    # act
    companies = CompanyService.new.find_companies

    # assert
    assert_not_nil(companies)
    assert_equal(1, companies.count)
    assert_equal(created_company, companies.first)
  end

  def reset_db
    User.delete_all
    Company.delete_all
    User.delete_all
  end
end
