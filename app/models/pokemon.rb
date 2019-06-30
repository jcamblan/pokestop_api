# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id             :bigint           not null, primary key
#  nid            :string           not null
#  generation_id  :bigint           not null
#  candy_id       :integer
#  buddy_distance :integer
#  kind           :string           default("normal")
#  alolan_form_id :bigint
#  flee_rate      :decimal(, )
#  capture_rate   :decimal(, )
#  base_atk       :integer
#  base_def       :integer
#  base_sta       :integer
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

  def max_cp(level)
    cp(15, 15, 15, level)
  end

  def min_cp(level)
    cp(0, 0, 0, level)
  end

  def cp(ind_atk, ind_def, ind_sta, level)
    attack = base_atk + ind_atk
    defense = base_def + ind_def
    stamina = base_sta + ind_sta
    cpm = Utils::CPM_BY_LVL.dig(level)
    cp = attack * defense**0.5 * stamina**0.5 * cpm**2 / 10
    cp.to_i
  end

  def hp(level, ind_sta)
    hp = Utils::CPM_BY_LVL.dig(level) * (base_sta + ind_sta)
    hp.to_i
  end
end
