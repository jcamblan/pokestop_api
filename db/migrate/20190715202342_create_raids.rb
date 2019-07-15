# frozen_string_literal: true

class CreateRaids < ActiveRecord::Migration[6.0]
  def change
    create_table :raids do |t|
      t.string :kind, default: :normal
      t.integer :level, null: false
      t.timestamps
    end
  end
end
