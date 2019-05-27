# frozen_string_literal: true

# Pokemons
class CreatePokemons < ActiveRecord::Migration[6.0]
  def change # rubocop:disable Metrics/MethodLength
    create_table :pokemons do |t|
      t.string :num
      t.bigint :generation_id
      t.integer :candy_id
      t.integer :candy_distance
      t.text :pokedex_entry
      t.text :comment
      t.decimal :flee_rate
      t.decimal :capture_rate
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Pokemon.create_translation_table! name: :string, description: :text
      end

      dir.down do
        Pokemon.drop_translation_table!
      end
    end
  end
end
