Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'

  resources :episodes, path: '/'#, except: [:index, :show]
  root 'episodes#index'
  # get '*id', to: 'episodes#show'#, as: :episode
end
