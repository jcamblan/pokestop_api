# frozen_string_literal: true

# == Schema Information
#
# Table name: researches
#
#  id         :bigint           not null, primary key
#  available  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Research < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================

  translates :name, :description, touch: true

  # == Extensions ==============================================================
  # == Relationships ===========================================================

  has_many :steps, class_name: 'ResearchStep'

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
