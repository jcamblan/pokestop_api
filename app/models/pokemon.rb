# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id             :bigint           not null, primary key
#  nid            :string           not null
#  pkgo_id        :string
#  generation_id  :bigint           not null
#  candy_id       :integer
#  buddy_distance :integer
#  kind           :string           default("normal")
#  alolan_form_id :bigint
#  normal_form_id :bigint
#  flee_rate      :decimal(, )
#  capture_rate   :decimal(, )
#  base_atk       :integer
#  base_def       :integer
#  base_sta       :integer
#  shiny          :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  rarity         :string           default("normal")
#

class Pokemon < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, :description, :category, touch: true

  has_many :evolutions, foreign_key: :from_pokemon_id, dependent: :destroy
  has_many :next_forms, class_name: 'Pokemon',
                        through: :evolutions,
                        source: :to_pokemon
  has_one :prevolution, class_name: 'Evolution', foreign_key: :to_pokemon_id
  has_one :previous_form, class_name: 'Pokemon',
                          through: :prevolution,
                          source: :from_pokemon

  has_many :skins, dependent: :destroy

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :move_pokemons
  has_many :moves, through: :move_pokemons

  has_many :egg_pokemons
  has_many :eggs, through: :egg_pokemons, source: :egg

  has_many :pokemon_raids, dependent: :destroy
  has_many :raids, through: :pokemon_raids

  # == Validations =============================================================

  enumerize :kind, in: %i[normal alolan]
  enumerize :rarity, in: %i[normal legendary fabulous]

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================

  def max_cp(level)
    cp(15, 15, 15, (level || 40))
  end

  def min_cp(level)
    cp(0, 0, 0, level)
  end

  def cp(ind_atk, ind_def, ind_sta, level)
    return nil unless base_atk && base_def && base_sta

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
