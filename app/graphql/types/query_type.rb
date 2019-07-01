# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :generations,
          [Types::GenerationType],
          null: false,
          description: 'Returns generations list'

    field :pokemons,
          [Types::PokemonType],
          null: false,
          description: 'Returns pokemons list'

    field :pokemon, PokemonType, null: false, description: 'show pokemon' do
      argument :pokemon_id, ID, required: true, as: :id
    end

    def generations
      Generation.all
    end

    def pokemons
      Pokemon.all.order(:nid)
    end

    def pokemon(id:)
      Pokemon.find(id)
    end
  end
end
