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

    def generations
      Generation.all
    end

    def pokemons
      Pokemon.all.order(:nid)
    end
  end
end
