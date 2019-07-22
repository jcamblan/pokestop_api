# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemon_skins
#
#  id         :bigint           not null, primary key
#  kind       :string           default("normal")
#  gender     :string           default("neutral")
#  shiny      :boolean          default(FALSE)
#  image_data :text
#  pokemon_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PokemonSkin < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================

  include PokemonUploader[:image]

  # == Relationships ===========================================================

  belongs_to :pokemon, optional: true

  # == Validations =============================================================

  enumerize :kind, in: %i[normal special alolan]
  enumerize :gender, in: %i[neutral male female]

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
