# frozen_string_literal: true

# Moves
class CreateMoves < ActiveRecord::Migration[6.0]
  def change # rubocop:disable Metrics/MethodLength
    create_table :moves do |t|
      t.string :kind
      t.integer :type_id
      t.decimal :power
      t.decimal :epu
      t.decimal :cast_time
      t.integer :energy_bars

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Move.create_translation_table! name: :string, description: :text
      end

      dir.down do
        Move.drop_translation_table!
      end
    end
  end
end
