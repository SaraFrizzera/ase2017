cd db
del development.sqlite3
del test.sqlite3
rake db:migrate
rake db:setup
