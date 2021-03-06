# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w[login.css]
Rails.application.config.assets.precompile += %w[toastr.js]
Rails.application.config.assets.precompile += %w[login_api_calls.js]

#company view
Rails.application.config.assets.precompile += %w[index.js]
Rails.application.config.assets.precompile += %w[companyMain.js]
Rails.application.config.assets.precompile += %w[company.css]
Rails.application.config.assets.precompile += %w[index.css]
Rails.application.config.assets.precompile += %w[pie_chart.js]

# admin view
Rails.application.config.assets.precompile += %w[admin.css]
Rails.application.config.assets.precompile += %w[loader.css]
