# frozen_string_literal: true

module Types
  class PokemonType < Types::BaseObject
    field :id, ID, null: false
    field :nid, String, null: false, description: 'National Pokemon ID'
    field :name, String, null: true
    field :kind, String, null: false
    field :base_atk, Float, null: true, description: 'Pokemon base Attack'
    field :base_def, Float, null: true, description: 'Pokemon base Defense'
    field :base_sta, Float, null: true, description: 'Pokemon base Stamina'
    field :types, [Types::TypeType], null: false, description: 'Pokemon types'
    field :fast_moves, [Types::MoveType], null: true, description: ''
    field :charge_moves, [Types::MoveType], null: true, description: ''
    field :generation_id, ID, null: false
    field :category, String, null: true
    field :description, String, null: true
    field :skins, [Types::PokemonSkinType], null: true
    field :previous_nid, String, null: false
    field :next_nid, String, null: false

    field :max_cp, Float, null: true, description: 'Max CP value of pokemon' do
      argument :level, Int, required: false,
                            description: 'max CP value for given level'
    end

    field :next_forms, [Types::PokemonType], null: true
    field :previous_form, PokemonType, null: true

    field :translations, [Types::PokemonTranslationType], null: true

    def fast_moves
      object.moves.where(kind: :fast)
    end

    def charge_moves
      object.moves.where(kind: :charge)
    end

    def max_cp(level: nil)
      object.max_cp(level)
    end
  end
end
