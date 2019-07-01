# frozen_string_literal: true

module Types
  class TypeTranslationType < Types::BaseObject
    field :name, String, null: true
    field :locale, String, null: false
  end
end
