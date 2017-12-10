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
      begin
        admin = User.find_by(username: 'a') # TODO: change to admin
        user1 = User.find_by(username: 'b') # TODO: change
        company1 = Company.find_by(company_name: 'c', vat_number: 'c') # TODO: change

        activity1 = Activity.find_by(start_time: '22 Jan 2013 15:00:00', end_time: '22 Jan 2013 16:00:00', company: company1, user: user1) # TODO: change

        unless admin
          admin = User.new username: 'a', password: 'a', user_type: 2 # admin creation
          admin.save
        end

        unless company1
          company1 = Company.new company_name: 'c', vat_number: 'c'
          company1.save
        end

        unless user1
          user1 = User.new username: 'b', password: 'b', user_type: 1
          user1.save
        end

        unless activity1
          activity1 = Activity.new start_time: '22 Jan 2013 15:00:00', end_time: '22 Jan 2013 16:00:00', company: company1, user: user1
          activity1.save
        end
      rescue => exception
        puts 'errore in startp. db non rigenerato, errore: ' + exception
      end
    end
  end
end
