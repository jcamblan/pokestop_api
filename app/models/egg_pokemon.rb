# == Schema Information
#
# Table name: egg_pokemons
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint
#  egg_id     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EggPokemon < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :pokemon
  belongs_to :egg

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
