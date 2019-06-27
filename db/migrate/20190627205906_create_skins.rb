# frozen_string_literal: true

class CreateSkins < ActiveRecord::Migration[6.0]
  def change
    create_table :skins do |t|
      t.integer :pokemon_id, null: false
      t.string  :gender, null: false
      t.string  :kind, null: false
      t.timestamps
    end
  end
end
