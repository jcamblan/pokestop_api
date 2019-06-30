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

require 'test_helper'

class EggPokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
