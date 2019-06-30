# frozen_string_literal: true

# == Schema Information
#
# Table name: research_rewards
#
#  id              :bigint           not null, primary key
#  rewardable_type :string           not null
#  rewardable_id   :bigint           not null
#  reward_type     :string           not null
#  reward_id       :bigint
#  quantity        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ResearchReward < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :rewardable, polymorphic: true
  belongs_to :reward, polymorphic: true, optional: true

  # == Validations =============================================================

  enumerize :rewardable_type, in: %i[ResearchStep ResearchTask]
  enumerize :reward_type, in: %i[Item Pokemon Xp Candy]

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
