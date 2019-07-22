# frozen_string_literal: true

class CreatePokemonSkins < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_skins do |t|
      t.string     :kind,   default: :normal
      t.string     :gender, default: :neutral
      t.boolean    :shiny, default: false
      t.text       :image_data
      t.references :pokemon
      t.timestamps
    end
  end
end
