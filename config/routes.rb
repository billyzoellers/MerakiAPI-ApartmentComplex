Rails.application.routes.draw do
    resources :units, except: [:new, :destroy, :show] do
        get 'troubleshoot'
    end
  
end