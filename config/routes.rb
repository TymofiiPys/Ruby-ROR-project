Rails.application.routes.draw do
  root "journal#index"

  get 'journal', to: "journal#index"
  get 'journal/:id', to: 'journal#show'
  get 'journal/new', to: 'journal#new'
  get 'journal/create', to: 'journal#create'
  get 'journal/edit', to: 'journal#edit'
  get 'journal/update', to: 'journal#update'
  get 'journal/destroy', to: 'journal#destroy'
end
