# frozen_string_literal: true

class Types::RewardsArray < Types::BaseScalar
  description 'custom json'

  def self.coerce_input(input_value, _context)
    input_value
  end

  def self.coerce_result(ruby_value, _context)
    ruby_value
  end
end
