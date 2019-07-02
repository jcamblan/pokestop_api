# frozen_string_literal: true

module Types
  class ResearchTaskType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :research_id, ID, null: true

    field :research_rewards, [Types::ResearchRewardType], null: true

    field :translations, [Types::ResearchStepTranslationType], null: true
  end
end
