# frozen_string_literal: true

module Types
  class EvolutionType < Types::BaseObject
    field :first_pokemon, PokemonType, null: false
    field :from_pokemon, PokemonType, null: false
    field :to_pokemon, PokemonType, null: false
    field :required_item, ItemType, null: true

    field :first_pokemon_id, ID, null: false
    field :from_pokemon_id, ID, null: false
    field :to_pokemon_id, ID, null: false
    field :required_item_id, ID, null: true
    field :required_candies_count, Int, null: true
  end
end
