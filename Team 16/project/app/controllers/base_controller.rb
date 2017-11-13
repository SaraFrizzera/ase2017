class BaseController < ActionController::Base
  def service_handler(service_function, headers = nil)
    (render json: service_function.call; return) if headers.nil? #trasforma in json tutto l'output della funzione. Richiama la funzione service_function da user_controller
    render json: service_function.call(headers) # se la funzione non contiene headers ritorna l'output, altrimenti richiama anche gli headers
  rescue ArgumentError => exception
    render json: { error: exception.message }, status: :bad_request
  end
end