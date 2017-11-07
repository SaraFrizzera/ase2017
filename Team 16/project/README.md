# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

[RUN SERVER]
ruby bin\rails server           <-- ctrl c to stop

								[MODELLI E MIGRAZIONE DB]
[crea modello]
rails g model <model_name> title:string created_by:string
[cancella modello]
rails destroy model <model_name>
[migrazione modelli]
rails db:migrate RAILS_ENV=development

