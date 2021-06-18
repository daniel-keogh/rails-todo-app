Rails.application.routes.draw do
  root :to => redirect('/todos')
    
  resources :todos
    
  get '/todos/:id/category', to: 'todos#category', as: 'category'
end
