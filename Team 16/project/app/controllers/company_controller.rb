class CompanyController < BaseController
  def create
    puts request.headers['companyName']
    puts request.headers['vatNumber']



    service_handler CompanyService.new.method(:create_company), request.headers
  end

  def find_all
    raise 'not implemented'
  end

  def find_specific
    raise 'not implemented'
  end

  def delete
    raise 'not implemented'
  end
end
