# README

https://learnrubythehardway.org/book/ex46.html          <--- project structure

https://github.com/bbatsov/ruby-style-guide             <--- best practice guide

http://guides.rubyonrails.org/getting_started.html      <--- rails guide

https://help.github.com/articles/enabling-required-reviews-for-pull-requests/       <--- pull request 

[install rails]
http://railsinstaller.org/en


[gem list]
bundle install                  <-- install rails bundle (?)

gem install rake                <-- test unit run by command -->           rake test

[necessario node.js]
https://nodejs.org/it/download/

[RUN SERVER]
ruby bin\rails server           <-- ctrl c to stop

								[MODELLI E MIGRAZIONE DB]
[crea modello]
rails g model <model_name> title:string created_by:string
[cancella modello]
rails destroy model <model_name>
[migrazione modelli]
rails db:migrate RAILS_ENV=development

[mostra API routes]
rake routes

[run test]
rails db:migrate RAILS_ENV=test
rake test

