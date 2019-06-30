# frozen_string_literal: true

# == Schema Information
#
# Table name: rewards
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

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
