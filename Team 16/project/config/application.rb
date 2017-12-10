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
        unless admin
          admin = User.new username: 'a', password: 'a', user_type: 2 # admin creation
          admin.save
        end

        user1 = User.find_by(username: 'b') # TODO: change
        unless user1
          user1 = User.new username: 'b', password: 'b', user_type: 1
          user1.save
        end

        user2 = User.find_by(username: 'Dario') # TODO: change
        unless user2
          user2 = User.new username: 'Dario', password: 'password', user_type: 1
          user2.save
        end

        company1 = Company.find_by(company_name: 'c', vat_number: 'c') # TODO: change
        unless company1
          company1 = Company.new company_name: 'c', vat_number: 'c'
          company1.save
        end

        company2 = Company.find_by(company_name: 'D&G', vat_number: '666') # TODO: change
        unless company2
          company2 = Company.new company_name: 'D&G', vat_number: '666'
          company2.save
        end

        activity1 = Activity.find_by(start_time:Time.zone.parse('6 Dec 2017 10:00:00'), end_time: Time.zone.parse('6 Dec 2017 16:00:00'), company: company1, user: user1) # TODO: change
        unless activity1
          activity1 = Activity.new start_time: '6 Dec 2017 10:00:00', end_time: '6 Dec 2017 16:00:00', company: company1, user: user1
          activity1.save
        end

        activity2 = Activity.find_by(start_time: Time.zone.parse('7 Dec 2017 15:00:00'), end_time: Time.zone.parse('7 Dec 2017 16:00:00'), company: company1, user: user1) # TODO: change
        unless activity2
          activity2 = Activity.new start_time: '7 Dec 2017 15:00:00', end_time: '7 Dec 2017 16:00:00', company: company1, user: user1
          activity2.save
        end

        activity3 = Activity.find_by(start_time: Time.zone.parse('8 Dec 2017 8:00:00'), end_time: Time.zone.parse('8 Dec 2017 13:00:00'), company: company2, user: user2) # TODO: change
        unless activity3
          activity3 = Activity.new start_time: '8 Dec 2017 8:00:00', end_time: '8 Dec 2017 13:00:00', company: company2, user: user2
          activity3.save
        end

        activity4 = Activity.find_by(start_time: Time.zone.parse('9 Dec 2017 8:00:00'), end_time: Time.zone.parse('9 Dec 2017 13:00:00'), company: company1, user: user2) # TODO: change
        unless activity4
          activity4 = Activity.new start_time: '9 Dec 2017 8:00:00', end_time: '9 Dec 2017 13:00:00', company: company1, user: user2
          activity4.save
        end
      rescue => exception
        puts 'errore in startp. db non rigenerato, errore: ' + exception.to_s
      end
    end
  end
end
