# frozen_string_literal: true

class CreateEggs < ActiveRecord::Migration[6.0]
  def change
    create_table :eggs do |t|
      t.boolean :available
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Egg.create_translation_table! name: :string, description: :text
      end

      dir.down do
        Egg.drop_translation_table!
      end
    end

    create_table :eggs_pokemons do |t|
      t.integer :egg_id
      t.integer :pokemon_id
    end
  end
end
