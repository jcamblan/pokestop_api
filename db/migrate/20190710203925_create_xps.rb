# frozen_string_literal: true

class CreateXps < ActiveRecord::Migration[6.0]
  def change
    create_table :xps, &:timestamps

    reversible do |dir|
      dir.up do
        Xp.create_translation_table! name: :string
      end

      dir.down do
        Xp.drop_translation_table!
      end
    end
  end
end
