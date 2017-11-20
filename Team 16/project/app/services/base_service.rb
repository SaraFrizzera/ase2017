class BaseService
  def validate_params(params) #controlla che i parametri non siano nulli, se lo sono lancia un'exeption
    params.each { |a| raise ArgumentError, 'Headers validation failed' if a.nil? || a.empty? }
    false
  end
end
