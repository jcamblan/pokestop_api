# frozen_string_literal: true

module Types
  class ResearchStepType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :research_id, ID, null: true

    field :tasks, [Types::ResearchTaskType], null: true

    field :translations, [Types::ResearchStepTranslationType], null: true
  end
end
