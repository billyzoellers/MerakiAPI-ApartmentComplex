Rails.application.routes.draw do
    
  devise_for :users
    root to: "units#index"
    
    resources :units, except: [:new, :destroy, :show] do
        get 'troubleshoot'
    end
  
end