# frozen_string_literal: true

GraphiQL::Rails.config.headers['Authorization'] = ->(_context) { "bearer #{ENV['GRAPHIQL_TOKEN']}" }
