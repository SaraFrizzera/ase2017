class LoginService < BaseService # TODO: handle company login and sign in
  def sign_in_user(headers)
    UserService.new.create_user headers
  end

  def sign_in_company(headers)
    CompanyService.new.create_company headers
  end

  def log_in_user(headers)
    username = headers['username']
    password = headers['password']
    validate_params([username, password])

    user = User.find_by(username: username, password: password)
    raise ArgumentError, 'Wrong username or password' unless user
    user
  end

  def log_in_company(headers)
    vat_number = headers['vatNumber']
    company_name = headers['companyName']
    validate_params([vat_number, company_name])

    company = Company.find_by(vat_number: vat_number, company_name: company_name)
    raise ArgumentError, 'Wrong vatNumber or companyName' unless company
    company
  end
end