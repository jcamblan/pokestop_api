# frozen_string_literal: true

class CreatePokemonRaids < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_raids do |t|
      t.bigint :pokemon_id, null: false
      t.bigint :raid_id, null: false
      t.timestamps
    end
  end
end
