# frozen_string_literal: true

class CreateCandies < ActiveRecord::Migration[6.0]
  def change
    create_table :candies do |t|
      t.string :primary_color
      t.string :secondary_color
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Candy.create_translation_table! name: :string
      end

      dir.down do
        Candy.drop_translation_table!
      end
    end
  end
end
