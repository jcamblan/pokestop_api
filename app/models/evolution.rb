# frozen_string_literal: true

# == Schema Information
#
# Table name: evolutions
#
#  id                     :bigint           not null, primary key
#  first_pokemon_id       :integer          not null
#  from_pokemon_id        :integer          not null
#  to_pokemon_id          :integer          not null
#  required_candies_count :integer
#  required_item_id       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Evolution < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :first_pokemon, class_name: 'Pokemon'
  belongs_to :from_pokemon, class_name: 'Pokemon'
  belongs_to :to_pokemon, class_name: 'Pokemon'

  has_one :item

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
