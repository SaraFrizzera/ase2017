class ActivityController < BaseController
  def create
    service_handler ActivityService.new.method(:create_activity), request.headers
  end

  def find_all
    service_handler ActivityService.new.method(:find_all_activity)
  end

  def find_specific
    service_handler ActivityService.new.method(:find_activity), request.headers
  end

  def delete
    service_handler ActivityService.new.method(:delete_activity), request.headers
  end
end
