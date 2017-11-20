class CreateUsers < ActiveRecord::Migration[5.1]
  def change #RICORDATI DI TENERE AGGIORNATA QUESTA CLASSE CON IL MODELLO
    create_table :users do |t|
      t.string :username 
      t.string :password
    end
  end
end
