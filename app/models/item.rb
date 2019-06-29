# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  # == Constants ===============================================================

  ITEM_CATEGORIES = %i[
    berry
    technical_machine
    egg_incubator
    evolution_item
    raid_pass
    pokeball
    potion_revive
    misc
  ].freeze

  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, :description, touch: true

  # == Validations =============================================================

  enumerize :kind, in: ITEM_CATEGORIES

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
