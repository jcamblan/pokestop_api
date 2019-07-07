# frozen_string_literal: true

Rails.application.routes.draw do
  Clearance.configure do |config|
    config.routes = false
  end

  use_doorkeeper

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  resources :users, only: :create
end
