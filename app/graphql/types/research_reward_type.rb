# frozen_string_literal: true

module Types
  class ResearchRewardType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
  end
end
