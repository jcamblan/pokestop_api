# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id             :bigint           not null, primary key
#  nid            :string           not null
#  generation_id  :bigint           not null
#  candy_id       :integer
#  candy_distance :integer
#  kind           :string           default("normal")
#  alolan_form_id :bigint
#  flee_rate      :decimal(, )
#  capture_rate   :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Pokemon < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, :description, touch: true

  has_many :evolutions, foreign_key: :from_pokemon_id, dependent: :destroy
  has_one :prevolution, class_name: 'Evolution', foreign_key: :to_pokemon_id
  has_one :previous_form, class_name: 'Pokemon',
                          through: :prevolution,
                          source: :from_pokemon

  has_many :skins, dependent: :destroy

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :move_pokemons
  has_many :moves, through: :move_pokemons

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
