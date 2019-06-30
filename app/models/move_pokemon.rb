# frozen_string_literal: true

# == Schema Information
#
# Table name: move_pokemons
#
#  id         :bigint           not null, primary key
#  move_id    :bigint
#  pokemon_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MovePokemon < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :pokemon
  belongs_to :move

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
