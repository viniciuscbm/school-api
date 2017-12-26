Rails.application.routes.draw do
  resources :schools
  
  # Routes for search in Schools, Students and Teachers.
  match 'schools_search/:params' => 'search#schools_search', via: 'get'
  match 'students_search/:params' => 'search#students_search', via: 'get'
  match 'teachers_search/:params' => 'search#teachers_search', via: 'get'
  
  # Route for Sidekiq Web.
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
