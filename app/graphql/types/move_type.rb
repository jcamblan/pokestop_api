# frozen_string_literal: true

module Types
  class MoveType < Types::BaseObject
    field :id, ID, null: false
    field :kind, String, null: false, description: ''
    field :name, String, null: true
    field :power, Float, null: true, description: ''
    field :epu, Float, null: true, description: ''
    field :cast_time, Float, null: true, description: ''
    field :energy_bars, Int, null: true, description: ''

    field :type, TypeType, null: false, description: ''

    field :translations, [Types::MoveTranslationType], null: false, description: ''
  end
end
