class CompanyController < BaseController
  def create
    service_handler CompanyService.new.method(:create_company), request.headers
  end

  def find_all
    service_handler CompanyService.new.method(:find_companies)
  end

  def find_specific
    service_handler CompanyService.new.method(:find_company), request.headers
  end

  def find_by_id
    service_handler CompanyService.new.method(:find_company_by_id), request.headers
  end

  def delete
    service_handler CompanyService.new.method(:delete_company), request.headers
  end
end
