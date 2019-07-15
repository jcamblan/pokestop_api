# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id             :bigint           not null, primary key
#  nid            :string           not null
#  pkgo_id        :string
#  generation_id  :bigint           not null
#  candy_id       :integer
#  buddy_distance :integer
#  kind           :string           default("normal")
#  alolan_form_id :bigint
#  normal_form_id :bigint
#  flee_rate      :decimal(, )
#  capture_rate   :decimal(, )
#  base_atk       :integer
#  base_def       :integer
#  base_sta       :integer
#  shiny          :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
