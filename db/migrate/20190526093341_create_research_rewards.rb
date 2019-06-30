# frozen_string_literal: true

class CreateResearchRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :research_rewards do |t|
      t.string :rewardable_type, null: false
      t.bigint :rewardable_id, null: false
      t.string :reward_type, null: false
      t.bigint :reward_id, null: true
      t.integer :quantity
      t.timestamps
    end
  end
end
