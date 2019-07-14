# frozen_string_literal: true

class PokestopApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  max_depth 8

  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "An object of type #{error.type.graphql_name} was hidden due to permissions"
  end

  def self.unauthorized_field(error)
    raise GraphQL::ExecutionError, "The field #{error.field.graphql_name} on an object of type #{error.type.graphql_name} was hidden due to permissions"
  end
end
