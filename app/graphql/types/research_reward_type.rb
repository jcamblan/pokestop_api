# frozen_string_literal: true

module Types
  class ResearchRewardType < Types::BaseObject
    field :id, ID, null: false
    field :reward, ResearchRewardUnion, null: true
    field :quantity, Int, null: true
  end
end
