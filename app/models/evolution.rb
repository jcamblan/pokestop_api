# frozen_string_literal: true

# == Schema Information
#
# Table name: evolutions
#
#  id                     :bigint           not null, primary key
#  first_pokemon_id       :integer          not null
#  from_pokemon_id        :integer          not null
#  to_pokemon_id          :integer          not null
#  required_candies_count :integer
#  required_item_id       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Evolution < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :first_pokemon, class_name: 'Pokemon'
  belongs_to :from_pokemon, class_name: 'Pokemon'
  belongs_to :to_pokemon, class_name: 'Pokemon'

  belongs_to :required_item, class_name: 'Item'

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================

  def self.evolutions(pokemon_id, evols, pokemons)
    evols.select { |e| e.from_pokemon_id == pokemon_id }.map do |e|
      hash = {}
      hash[:pokemon] = pokemons.find { |p| p.id == e.to_pokemon_id }
      hash[:required_candies_count] = e.required_candies_count
      hash[:item] = Item.find(e.required_item_id) if e.required_item_id
      if evols.select { |i| i.from_pokemon_id == e.to_pokemon_id }.any?
        hash[:evolutions] = Evolution.evolutions(
          e.to_pokemon_id,
          evols,
          pokemons
        )
      end
      hash
    end
  end

  # == Instance Methods ========================================================

  def chain
    evolutions_list = Evolution.where(first_pokemon_id: first_pokemon_id)
    pokemons = Pokemon.find(
      evolutions_list.pluck(:from_pokemon_id, :to_pokemon_id).flatten.uniq
    )
    {
      pokemon: pokemons.find { |p| p.id == first_pokemon_id },
      evolutions: Evolution.evolutions(
        first_pokemon_id,
        evolutions_list,
        pokemons
      )
    }
  end
end
