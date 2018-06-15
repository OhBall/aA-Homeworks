Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :show]
  resource :session, only:[:destroy,:new,:create]
  resources :bands
  resources :albums, except:[:index]
  resources :tracks, except:[:index]
end
