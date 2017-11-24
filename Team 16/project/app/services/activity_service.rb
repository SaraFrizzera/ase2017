class ActivityService < BaseService
  def create_activity(headers)
    username = headers['username']
    company_vat_number = headers['vatNumber']
    start_time = headers['startTime']
    end_time = headers['endTime']
    validate_params([username, company_vat_number, start_time, end_time])

    user = User.find_by(username: username)
    company = Company.find_by(vat_number: company_vat_number)
    raise ArgumentError, 'User not exists in database' unless user
    raise ArgumentError, 'Company not exists in database' unless company
    raise ArgumentError, 'Activity already existing' if Activity.find_by(start_time: start_time, end_time: end_time)

    activity = Activity.new start_time: start_time, end_time: end_time, company: company, user: user
    activity.save
    activity
  end

  def find_activity(_headers)
    raise 'not implemented'
  end

  def find_all_activity
    raise 'not implemented'
  end

  def delete(_headers)
    raise 'not implemented'
  end
end
