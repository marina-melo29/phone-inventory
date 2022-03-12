Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, path: '/' do

    resources :cellphones, only: [:index, :create]
    post '/cellphones/destroyall' => 'cellphones#destroy'

  end

end
