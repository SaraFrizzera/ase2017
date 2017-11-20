cd db
del development.sqlite3
rake db:migrate
rails db:migrate RAILS_ENV=development
pause
