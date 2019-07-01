module Types
  class PokemonTranslationType < Types::BaseObject
    field :locale, String, null: false
    field :name, String, null: true
    field :description, String, null: true
  end
end
