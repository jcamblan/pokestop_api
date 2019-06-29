# frozen_string_literal: true

class CreateTypeEffectivenesses < ActiveRecord::Migration[6.0]
  def change
    create_table :type_effectivenesses do |t|
      t.integer :attacking_type_id
      t.integer :defending_type_id
      t.string :effectiveness
      t.timestamps
    end
  end
end
