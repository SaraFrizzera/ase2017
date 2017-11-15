class CompanyService < BaseService
  def create_company(headers)
    company_name = headers['companyName']
    vat_number = headers['vatNumber']

    validate_params([company_name, vat_number])

    raise 'Company name already existing' if Company.find_by(company_name: company_name)

    company = Company.new company_name: company_name, vat_number: vat_number
    company.save
    company
  end

  def find_company(headers)
    company_name = headers['companyName']
    validate_params([company_name])

    Company.find_by(company_name: company_name)
  end

  def find_all_companies
    Company.all
  end

  def delete(headers)
    company_name = headers['companyName']
    validate_params([company_name])

    Company.find_by(company_name: company_name).destroy
  end
end
