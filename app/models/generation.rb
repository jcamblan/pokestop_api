# frozen_string_literal: true

# == Schema Information
#
# Table name: generations
#
#  id         :bigint           not null, primary key
#  uid        :integer
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Generation < ApplicationRecord
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
