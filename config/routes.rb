Rails.application.routes.draw do
  resources :compare_ranges
  resources :known_issues
  resources :screendump_results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
