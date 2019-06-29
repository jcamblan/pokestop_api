# == Schema Information
#
# Table name: move_pokemons
#
#  id         :bigint           not null, primary key
#  move_id    :bigint
#  pokemon_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MovePokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
