Rails.application.routes.draw do

  root 'login#dispatcher'

  get '/login/form', to: 'login#form'
  post '/login/sign_in', to: 'login#sign_in'
  post '/login/sign_up', to: 'login#sign_up'
  get '/logout', to: 'login#sign_out'

  get '/conferences/home', to: 'conferences#home'
  get '/conferences/feedback', to: 'conferences#feedback'
  post '/conferences/feedback', to: 'conferences#feedback_update'
  get '/conferences/:id', to: 'conferences#details'
  get '/conferences/:id/toggle_attend', to: 'conferences#toggle_attend'

  get '/suggestions/home', to: 'suggestions#home'
  post '/suggestions/new', to: 'suggestions#new'
  get '/suggestions/:id', to: 'suggestions#details'
  get '/suggestions/:id/toggle_like', to: 'suggestions#toggle_like'

  get '/backoffice/home', to: 'backoffice#home'
  get '/backoffice/new_conference', to: 'backoffice#new_conference'
  post '/backoffice/new_conference/post', to: 'backoffice#create'
  get '/backoffice/edit/:id', to: 'backoffice#edit'
  post 'backoffice/edit/:id/post', to: 'backoffice#update'
  get '/backoffice/feedbacks/:id', to: 'backoffice#feedbacks'
  get '/backoffice/reservations/:id', to: 'backoffice#reservations'
  get '/backoffice/reservations/delete/:id', to: 'backoffice#delete_reservation'
  get '/backoffice/suggestions/delete/:id', to: 'backoffice#delete_suggestion'
  post '/backoffice/admins/add', to: 'backoffice#add_admin'
  get '/backoffice/admins/revoke/:id', to: 'backoffice#revoke_admin'

end
