# frozen_string_literal: true

GraphiQL::Rails.config.headers['Authorization'] = lambda {
  "bearer #{ENV['GRAPHIQL_TOKEN']}"
}
