Rails.application.routes.draw do

  root 'login#dispatcher'

  get '/login/form', to: 'login#form'
  post '/login/sign_in', to: 'login#sign_in'
  post '/login/sign_up', to: 'login#sign_up'
  get '/logout', to: 'login#sign_out'

  get '/conferences/home', to: 'conferences#home'
  get '/conferences/feedback', to: 'conferences#feedback'
  get '/conferences/:id', to: 'conferences#details'
  get '/conferences/:id/toggle_attend', to: 'conferences#toggle_attend'

end
