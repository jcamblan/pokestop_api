# frozen_string_literal: true

module Types
  class RaidType < Types::BaseObject
    field :id, ID, null: false
    field :kind, String, null: false
    field :level, Int, null: false
    field :pokemons, [Types::PokemonType], null: true
  end
end
