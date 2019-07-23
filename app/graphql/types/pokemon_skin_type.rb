# frozen_string_literal: true

module Types
  class PokemonSkinType < Types::BaseObject
    field :kind, String, null: false
    field :gender, String, null: false
    field :shiny, Boolean, null: false
    field :image_url, String, null: true
  end
end
