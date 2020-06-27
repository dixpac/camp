Rails.application.routes.draw do
  resources :projects

  resources :buckets do
    resources :messages
  end

  root "projects#index"
end
