# frozen_string_literal: true

class CreateGenerations < ActiveRecord::Migration[6.0]
  def change
    create_table :generations do |t|
      t.integer :uid
      t.boolean :available
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Generation.create_translation_table! name: :string
      end

      dir.down do
        Generation.drop_translation_table!
      end
    end
  end
end
