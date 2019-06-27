# frozen_string_literal: true

class CreateResearches < ActiveRecord::Migration[6.0]
  def change
    create_table :researches do |t|
      t.boolean :available, default: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Research.create_translation_table! name: :string, description: :text
      end

      dir.down do
        Research.drop_translation_table!
      end
    end
  end
end
