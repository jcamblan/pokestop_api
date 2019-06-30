# frozen_string_literal: true

class CreateMovePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :move_pokemons do |t|
      t.bigint :move_id
      t.bigint :pokemon_id
      t.timestamps
    end
  end
end
