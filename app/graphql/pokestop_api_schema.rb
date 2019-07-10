# frozen_string_literal: true

class PokestopApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  max_depth 8
end
