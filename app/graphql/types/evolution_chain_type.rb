# frozen_string_literal: true

module Types
  class EvolutionChainType < Types::BaseObject
    field :chain, Types::Json, null: false
  end
end
