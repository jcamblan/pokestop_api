# frozen_string_literal: true

class AddRarityOnPokemon < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :pokemons, :rarity, :string, default: :normal
      end

      dir.down do
        remove_column :pokemons, :rarity
      end
    end
  end
end
