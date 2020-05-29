Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, except: :index do
    resources :doses, only: [:index, :new, :create, :destroy]
  end

  resource :ingredients
  delete '/doses/:id', to: 'doses#destroy'
end
