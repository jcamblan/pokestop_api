# frozen_string_literal: true

# == Schema Information
#
# Table name: evolutions
#
#  id                     :integer          not null, primary key
#  first_pokemon_id       :integer          not null
#  from_pokemon_id        :integer          not null
#  to_pokemon_id          :integer          not null
#  reference_pokemon_id   :integer          not null
#  required_candies_count :integer          not null
#  required_item_id       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Evolution < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :first_pokemon
  belongs_to :from_pokemon
  belongs_to :to_pokemon
  belongs_to :reference_pokemon

  has_one :candy, through: :reference_pokemon

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
