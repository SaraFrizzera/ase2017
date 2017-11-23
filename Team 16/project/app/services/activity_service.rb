class ActivityService < BaseService
  def create_activity(headers)
    username = headers['username']
    company_vat_number = headers['vatNumber']
    start_time = headers['startTime']
    end_time = headers['endTime']
    validate_params([username, company_vat_number, start_time, end_time])

    raise ArgumentError, 'User not exists in database' unless User.find_by(username: username)
    raise ArgumentError, 'Company not exists in database' unless Company.find_by(vat_number: company_vat_number)
    raise ArgumentError, 'Activity already existing' if Activity.find_by(start_time: start_time, end_time: end_time)

    activity = Activity.new username: username, company_vat_number: company_vat_number, start_time: start_time, end_time: end_time
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
