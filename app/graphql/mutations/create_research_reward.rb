# frozen_string_literal: true

module Mutations
  class CreateResearchReward < BaseMutation
    argument :rewardable_type, Types::RewardableKind, required: true
    argument :rewardable_id, ID, required: true
    argument :reward_type, Types::RewardKind, required: true
    argument :reward_id, ID, required: true
    argument :quantity, Int, required: true

    type Types::ResearchRewardType

    def resolve(rewardable_id, rewardable_type, reward_id, reward_type, quantity)
      ResearchReward.create!(
        rewardable_id: rewardable_id,
        rewardable_type: rewardable_type,
        reward_id: reward_id,
        reward_type: reward_type,
        quantity: quantity
      )
    end
  end
end
