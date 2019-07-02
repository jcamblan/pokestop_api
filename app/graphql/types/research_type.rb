# frozen_string_literal: true

module Types
  class ResearchType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :available, Boolean, null: false

    field :steps, [Types::ResearchStepType], null: true

    field :translations, [Types::ResearchTranslationType], null: true
  end
end
