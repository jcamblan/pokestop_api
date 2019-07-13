# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_research_task, mutation: Mutations::CreateResearchTask
    field :create_research_reward, mutation: Mutations::CreateResearchReward
  end
end
