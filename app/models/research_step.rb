# frozen_string_literal: true

# == Schema Information
#
# Table name: research_steps
#
#  id          :bigint           not null, primary key
#  research_id :bigint           not null
#  step_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResearchStep < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================

  translates :name, touch: true

  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :research

  has_many :tasks, class_name: 'ResearchTask'
  has_many :research_rewards, as: :rewardable

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
