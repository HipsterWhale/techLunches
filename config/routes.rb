Rails.application.routes.draw do

  root 'login#dispatcher'

  get '/login/form', to: 'login#form'
  post '/login/sign_in', to: 'login#sign_in'
  post '/login/sign_up', to: 'login#sign_up'
  get '/logout', to: 'login#sign_out'

end
