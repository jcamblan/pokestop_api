# frozen_string_literal: true

# == Schema Information
#
# Table name: research_tasks
#
#  id               :bigint           not null, primary key
#  research_step_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ResearchTask < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================

  translates :description, touch: true

  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :research_step

  has_one :research, through: :research_step

  has_one :research_reward, as: :rewardable

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
