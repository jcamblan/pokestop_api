# frozen_string_literal: true

module Types
  class EggType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :pokemons, [Types::PokemonType], null: true
  end
end
