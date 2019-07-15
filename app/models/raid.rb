# frozen_string_literal: true

# == Schema Information
#
# Table name: raids
#
#  id         :bigint           not null, primary key
#  kind       :string           default("normal")
#  level      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Raid < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  has_many :pokemon_raids, dependent: :destroy
  has_many :pokemons, through: :pokemon_raids

  # == Validations =============================================================

  enumerize :kind, in: %i[normal ex]

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
