class BaseService
  def validate_params(params)
    params.each { |a| raise ArgumentError, 'Headers validation failed' if a.nil? || a.empty? }
    false
  end

  # TODO: remove? implicit conversion is made on model creation in db. probably this is useless
  def to_date(values)
    values.map { |v| v = Time.zone.parse v }
    values
  end
end
