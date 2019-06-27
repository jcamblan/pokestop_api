# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  # == Constants ===============================================================

  self.abstract_class = true

  # == Attributes ==============================================================
  # == Extensions ==============================================================

  extend Enumerize

  # == Relationships ===========================================================
  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
end
