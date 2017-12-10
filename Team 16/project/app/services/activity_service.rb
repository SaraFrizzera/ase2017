class ActivityService < BaseService
  def create_activity(headers)
    username = headers['username']
    company_vat_number = headers['vatNumber']
    start_time = headers['startTime']
    end_time = headers['endTime']
    validate_params([username, company_vat_number, start_time, end_time])

    user = User.find_by(username: username)
    company = Company.find_by(vat_number: company_vat_number)
    raise ArgumentError, 'User does not exist in database' unless user
    raise ArgumentError, 'Company does not exist in database' unless company
    raise ArgumentError, 'Activity already existing' if Activity.find_by(start_time: start_time, end_time: end_time)

    activity = Activity.new start_time: start_time, end_time: end_time, company: company, user: user
    activity.save
    activity
  end

  def find_activity(headers)
    username = headers['username']
    company_vat_number = headers['vatNumber']
    start_time = headers['startTime']
    end_time = headers['endTime']
    validate_params([username, company_vat_number, start_time, end_time])

    user = User.find_by(username: username)
    company = Company.find_by(vat_number: company_vat_number)
    raise ArgumentError, 'User does not exist in database' unless user
    raise ArgumentError, 'Company does not exist in database' unless company

    Activity.find_by(start_time: Time.zone.parse(start_time), end_time: Time.zone.parse(end_time), company_id: company.id, user_id: user.id)
  end

  def find_all_activity
    Activity.all
  end

  def find_activity_by_user(headers)
    username = headers['username']
    validate_params([username])

    user = User.find_by(username: username)
    raise ArgumentError, 'User does not exist in database' unless user
    Activity.find_by(user: user)
  end

  def delete(headers)
    return unless find_activity(headers)
    find_activity(headers).destroy
  end
end
