class UserService < BaseService
  def create_user(headers) # funzione che crea un utente con headers in input
    username = headers['username'] # salvo in username il valore dell'header username
    password = headers['password']
    validate_params([username, password]) # prende la funzione che controlla gli headers

    raise ArgumentError, 'Username already existing' if User.find_by(username: username)

    user = User.new username: username, password: password, user_type: 1 # crea un oggetto User con parametri di username e psw
    user.save # salva nel DB integrato l'utente
    user.attributes.slice('username', 'user_type')
  end

  def find_user(headers) # funzione che trova uno user grazie al suo username in input
    username = headers['username'] # salva in username il valore dell'header username
    password = headers['password']
    validate_params([username, password]) # controlla che sia corretto

    User.find_by(username: username, password: password, user_type: 1) # cerca tra gli users, quello con lo username in input
  end

  def find_all_users
    users = []

    User.all.each do |user|
      users.push user.slice('username', 'user_type', 'id')
    end

    users
  end

  def delete_user(headers)
    username = headers['username']
    validate_params([username])

    user = User.find_by(username: username)
    return if user.nil?
    user.destroy
  end
end
