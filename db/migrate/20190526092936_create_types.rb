# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types, &:timestamps

    reversible do |dir|
      dir.up do
        Type.create_translation_table! name: :string
      end

      dir.down do
        Type.drop_translation_table!
      end
    end
  end
end
