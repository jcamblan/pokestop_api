# frozen_string_literal: true

module Mutations
  class CreateResearchReward < BaseMutation
    argument :rewardable_type, Types::RewardableKind, required: true
    argument :rewardable_id, ID, required: true
    argument :reward_type, Types::RewardKind, required: true
    argument :reward_id, ID, required: true
    argument :quantity, Int, required: true

    type Types::ResearchRewardType

    def resolve(args)
      ResearchReward.create!(args)
    end

    def self.authorized?(object, context)
      super && context[:current_user]&.can_manage?(name)
    end
  end
end
