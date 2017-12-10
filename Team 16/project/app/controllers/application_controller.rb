class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # actions that happens every single time the frontend interacts with the application
end
