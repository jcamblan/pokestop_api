# frozen_string_literal: true

module Types
  class MoveTranslationType < Types::BaseObject
    field :locale, String, null: false
    field :name, String, null: true
    field :description, String, null: true
  end
end
