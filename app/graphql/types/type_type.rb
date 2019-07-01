# frozen_string_literal: true

module Types
  class TypeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :translations, [Types::TypeTranslationType], null: true
  end
end
