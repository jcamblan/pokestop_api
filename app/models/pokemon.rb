# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id             :integer          not null, primary key
#  num            :string
#  generation_id  :bigint
#  candy_id       :integer
#  candy_distance :integer
#  pokedex_entry  :text
#  comment        :text
#  flee_rate      :decimal(, )
#  capture_rate   :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Pokemon < ApplicationRecord
  translates :name, :description, touch: true
end
