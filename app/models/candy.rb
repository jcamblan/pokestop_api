# frozen_string_literal: true

# == Schema Information
#
# Table name: candies
#
#  id              :bigint           not null, primary key
#  primary_color   :string
#  secondary_color :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Candy < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, touch: true

  has_many :pokemons

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
