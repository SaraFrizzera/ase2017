class UserController < BaseController
  def create # crea uno user
    service_handler UserService.new.method(:create_user), request.headers # prende una funzione e un parametro. La funzione crea uno user con gli headers della richiesta
  end

  def find_all
    service_handler UserService.new.method(:find_all_users) # prende la funzione che cerca tutti gli user
  end

  def find_specific
    service_handler UserService.new.method(:find_user), request.headers # prende la funzione che cerca uno user particolare grazie al suo username
  end

  def delete
    raise 'not implemented'
  end
end
