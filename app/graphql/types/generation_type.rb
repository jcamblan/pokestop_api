module Types
  class GenerationType < Types::BaseObject
    field :id, ID, null: false
    field :uid, ID, null: false
    field :name, String, null: true
    field :pokemons, [Types::PokemonType], null: true
  end
end
