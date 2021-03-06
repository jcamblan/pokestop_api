# frozen_string_literal: true

# Pokemons
class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string  :nid, null: false
      t.string  :pkgo_id
      t.bigint  :generation_id, null: false
      t.integer :candy_id
      t.integer :buddy_distance
      t.string  :kind, default: :normal
      t.bigint  :alolan_form_id
      t.bigint  :normal_form_id
      t.decimal :flee_rate
      t.decimal :capture_rate
      t.integer :base_atk
      t.integer :base_def
      t.integer :base_sta
      t.boolean :shiny, default: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Pokemon.create_translation_table! name: :string,
                                          description: :text,
                                          category: :string
      end

      dir.down do
        Pokemon.drop_translation_table!
      end
    end
  end
end
