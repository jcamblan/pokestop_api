# frozen_string_literal: true

# == Schema Information
#
# Table name: type_effectivenesses
#
#  id                :bigint           not null, primary key
#  attacking_type_id :integer
#  defending_type_id :integer
#  effectiveness     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TypeEffectiveness < ApplicationRecord
  # == Constants ===============================================================

  EFFECTIVENESSES = %i[
    no_effect
    not_very_effective
    normal
    super_effective
  ].freeze

  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :attacking_type, class_name: 'Type'
  belongs_to :defending_type, class_name: 'Type'

  # == Validations =============================================================

  enumerize :effectiveness, in: EFFECTIVENESSES

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
