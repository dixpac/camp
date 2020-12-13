Rails.application.routes.draw do
  resources :projects do
    resources :message_boards, only: :index, module: "projects"
  end

  resources :buckets do
    resources :messages

    resources :recordings do
      resources :comments
    end
  end

  root "projects#index"
end
