# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemon_types
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint
#  type_id    :bigint
#

class PokemonType < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :pokemon
  belongs_to :type

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
