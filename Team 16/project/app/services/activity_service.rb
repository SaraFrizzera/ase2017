class ActivityService < BaseService
  def create_activity(headers)
    start_time = headers['startTime']
    end_time = headers['endTime']
    validate_params([start_time, end_time])
    raise ArgumentError, 'Activity name already existing' if Activity.find_by(start_time: start_time, end_time: end_time)

    activity = Activity.new start_time: start_time, end_time: end_time
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
