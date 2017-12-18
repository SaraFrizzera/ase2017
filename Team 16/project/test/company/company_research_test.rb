class CompanyResearchTest < ActionDispatch::IntegrationTest
  test 'Should create correct company when giving correct params' do
    reset_db

    # arrange
    creation_headers = { 'companyName' => 'RageDarioDevelopment', 'vatNumber' => '666' }

    # act
    company = CompanyService.new.create_company creation_headers

    # assert
    assert_not_nil(company)
    assert_equal(creation_headers['companyName'], company.company_name)
    assert_equal(creation_headers['vatNumber'], company.vat_number)
  end

  def reset_db
    User.delete_all
    Company.delete_all
    User.delete_all
  end
end