# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemon_raids
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  raid_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PokemonRaid < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :pokemon
  belongs_to :raid

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
