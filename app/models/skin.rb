# frozen_string_literal: true

# == Schema Information
#
# Table name: skins
#
#  id         :integer          not null, primary key
#  pokemon_id :integer          not null
#  gender     :string           not null
#  kind       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Skin < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :pokemon

  # == Validations =============================================================

  enumerize :gender, in: %i[male female]
  enumerize :kind, in: %i[normal shiny]

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
