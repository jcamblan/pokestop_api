# frozen_string_literal: true

module Types
  class PokemonType < Types::BaseObject
    field :id, ID, null: false
    field :nid, String, null: false, description: 'National Pokemon ID'
    field :base_atk, Float, null: true
    field :base_def, Float, null: true
    field :base_sta, Float, null: true
    field :max_cp, Float, null: true do
      argument :level, Int, required: false
    end

    field :translations, [Types::PokemonTranslationType], null: true

    def max_cp(level = nil)
      return object.max_cp(level[:level]) if level

      object.max_cp
    end
  end
end
