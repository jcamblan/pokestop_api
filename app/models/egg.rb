# frozen_string_literal: true

# == Schema Information
#
# Table name: eggs
#
#  id         :bigint           not null, primary key
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Egg < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, :description, touch: true

  has_many :pokemons

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
