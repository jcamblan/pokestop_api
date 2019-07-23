# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  Clearance.configure do |config|
    config.routes = false
  end
  

  use_doorkeeper

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'

  post '/graphql', to: 'graphql#execute'

  resources :users, only: :create
end
