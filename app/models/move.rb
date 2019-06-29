# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id          :bigint           not null, primary key
#  kind        :string
#  type_id     :integer
#  power       :decimal(, )
#  epu         :decimal(, )
#  cast_time   :decimal(, )
#  energy_bars :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Move < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  translates :name, :description, touch: true

  # == Validations =============================================================

  enumerize :kind, in: %i[fast charge]

  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
