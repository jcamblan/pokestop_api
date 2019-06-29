# frozen_string_literal: true

# == Schema Information
#
# Table name: evolutions
#
#  id                     :bigint           not null, primary key
#  first_pokemon_id       :integer          not null
#  from_pokemon_id        :integer          not null
#  to_pokemon_id          :integer          not null
#  reference_pokemon_id   :integer          not null
#  required_candies_count :integer          not null
#  required_item_id       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class EvolutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
