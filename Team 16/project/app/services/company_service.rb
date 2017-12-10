class CompanyService < BaseService
  def create_company(headers)
    company_name = headers['companyName']
    vat_number = headers['vatNumber']
    validate_params([company_name, vat_number])
    raise ArgumentError, 'Company name already existing' if Company.find_by(company_name: company_name)

    company = Company.new company_name: company_name, vat_number: vat_number
    company.save
    company
  end

  def find_company(headers)
    company_name = headers['companyName']
    validate_params([company_name])

    Company.find_by(company_name: company_name)
  end

  def find_company_by_id(headers)
    company_id = headers['id']
    validate_params([company_id])

    Company.find_by(id: company_id)
  end

  def find_companies
    Company.all
  end

  def delete(headers)
    company_name = headers['companyName']
    validate_params([company_name])

    Company.find_by(company_name: company_name).destroy
  end

  def company_user_work_amount(headers)
    activities = Array(ActivityService.new.find_activity_by_company(headers))
    work_amounts = []

    activities.each do |activity|
      amount = (((activity.end_time - activity.start_time) / 1.hour).round).to_i

      work_amaount = work_amounts.select { |w_a| w_a.user == activity.user.username }
      if !work_amaount.empty?
        work_amaount.first.amount = work_amaount.first.amount + amount
      else
        work_amounts.push (WorkAmount.new user: activity.user.username, amount: amount)
      end
    end

    work_amounts
  end
end
