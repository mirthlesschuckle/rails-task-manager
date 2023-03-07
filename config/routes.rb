Rails.application.routes.draw do
  # READ ALL
  get '/tasks', to: 'tasks#index', as: 'tasks'

  # CREATE - 2 STEPS (needs to be before read)
  # NEW
  get 'tasks/new', to: 'tasks#new', as: 'new_task'
  # CREATE
  post '/tasks', to: 'tasks#create'

  # READ ONE - number needs to be a dynamic value
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  # UPDATE - 2 STEPS
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'

  # DELETE
  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'
end
