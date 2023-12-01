Rails.application.routes.draw do
  root "journal_recs#index"

  # get 'journal', to: "journal#index"
  # get 'journal/:id(.:format)', to: 'journal#show'
  # get 'journal/new(.:format)', to: 'journal#new'
  # post 'journal(.:format)', to: 'journal#create'
  # get 'journal/:id/edit', to: 'journal#edit'
  # patch 'journal/:id(.:format)', to: 'journal#update'
  # delete 'journal/:id(.:format)', to: 'journal#destroy'

  resources :journal_recs
end
