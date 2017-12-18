class BaseService
  def validate_params(params)
    params.each { |a| raise ArgumentError, 'Headers validation failed' if a.nil? || a.empty? }
    false
  end
end
