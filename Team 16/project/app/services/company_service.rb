class CompanyService < BaseService
  def create_company(headers)
    company_name = headers['companyName']
    vat_number = headers['vatNumber']

    validate_params([company_name, vat_number])

    company = Company.new company_name: company_name, vat_number: vat_number
    company.save
    company
  end

  def find_user(_headers)
    raise 'not implemented'
  end

  def find_all_users
    raise 'not implemented'
  end
end
