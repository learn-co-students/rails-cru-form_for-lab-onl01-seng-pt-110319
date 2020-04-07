Rails.application.routes.draw do
  get 'artists/:index'

  get 'artists/:show'

  get 'artists/:new'

  get 'artists/:create'

  get 'artists/:edit'

  get 'artists/:update'

  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
