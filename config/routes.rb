Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :message_boards, only: :index, module: "projects"
  end

  resources :buckets do
    resources :messages

    resources :recordings do
      resources :comments
    end
  end

  # recordable_path(recording, filter: 'newest') => bucket_message_path(recording.bucket, recording, filter: 'newest')
  direct(:recordable) { |recording| url_for [ "bucket_#{recording.recordable_name}", bucket_id: recording.bucket_id, id: recording.id ] }
end
