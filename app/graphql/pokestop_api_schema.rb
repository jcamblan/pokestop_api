# frozen_string_literal: true

class PokestopApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
