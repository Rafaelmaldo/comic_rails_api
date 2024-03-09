Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptionController  
  get "up" => "rails/health#show", as: :rails_health_check
 
  Rails.application.routes.draw do
    resources :comicbooks,  only: [:index]
  end
end
