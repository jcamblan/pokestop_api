# frozen_string_literal: true

# == Schema Information
#
# Table name: types
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Type < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, touch: true

  has_many :pokemons

  has_many :defending_effectivenesses,
           class_name: 'TypeEffectiveness',
           foreign_key: :defending_type_id

  has_many :attacking_effectivenesses,
           class_name: 'TypeEffectiveness',
           foreign_key: :attacking_type_id

  has_many :weaknesses,
           through: :defending_effectivenesses,
           source: :attacking_type

  has_many :strengths,
           through: :attacking_effectivenesses,
           source: :defending_type

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
