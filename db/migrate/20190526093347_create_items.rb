# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :kind
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Item.create_translation_table! name: :string, description: :text
      end

      dir.down do
        Item.drop_translation_table!
      end
    end
  end
end
