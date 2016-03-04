Rails.application.routes.draw do
 root 'trips#index'

 resources :trips do
   resources :locations do
     resources :address
    end
  end
end
