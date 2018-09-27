Rails.application.routes.draw do
    
    root to: "units#index"
    
    resources :units, except: [:new, :destroy, :show] do
        get 'troubleshoot'
    end
  
end