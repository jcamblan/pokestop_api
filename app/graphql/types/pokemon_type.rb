# frozen_string_literal: true

module Types
  class PokemonType < Types::BaseObject
    field :id, ID, null: false
    field :nid, String, null: false
    field :name, String, null: true
    # field :description, Text, null: true
  end
end
