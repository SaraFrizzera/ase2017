require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProgettoIng2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.after_initialize do
      admin = User.find_by(username: 'a', password: 'a', user_type: 2) # todo change to admin

      unless admin
        admin = User.new username: 'a', password: 'a', user_type: 2 # admin creation
        admin.save
      end
    end
  end
end
