class WelcomeController < ApplicationController
  def index; end

  def test
    puts 'aaaa'
    user = User.new 'pippo'
    render json: user
  end
  
end

class User
  attr_reader :username

  def initialize(username)
    @username = username
  end
end