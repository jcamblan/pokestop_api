# frozen_string_literal: true

class CreateEvolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :evolutions do |t|
      t.integer :first_pokemon_id, null: false
      t.integer :from_pokemon_id, null: false
      t.integer :to_pokemon_id, null: false
      t.integer :reference_pokemon_id, null: false
      t.integer :required_candies_count, null: false
      t.integer :required_item_id
      t.timestamps
    end
  end
end
