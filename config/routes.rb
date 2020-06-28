Rails.application.routes.draw do
  resources :projects

  resources :buckets do
    resources :messages

    resources :recordings do
      resources :comments
    end
  end

  root "projects#index"
end
