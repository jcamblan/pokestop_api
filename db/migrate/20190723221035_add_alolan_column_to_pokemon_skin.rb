# frozen_string_literal: true

class AddAlolanColumnToPokemonSkin < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_skins, :alolan, :boolean, default: false
  end
end
