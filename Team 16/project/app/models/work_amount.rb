class WorkAmount
  attr_accessor :user, :amount

  def initialize(params = {})
    params.each { |key, value| send "#{key}=", value }
  end
end
