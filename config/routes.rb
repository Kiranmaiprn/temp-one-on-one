Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :employees, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers:{
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }

  resources :employees do
    get "subordinates", on: :collection
    get "all_employees", on: :collection
    get "current_employee_info", on: :collection
  end
  resources :one_on_ones do
    get "meetings", on: :collection
  end
end
