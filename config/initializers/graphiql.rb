# frozen_string_literal: true

GraphiQL::Rails.config.headers['POKESTOP_TOKEN'] = ->(_context) { ENV['POKESTOP_TOKEN'] }
