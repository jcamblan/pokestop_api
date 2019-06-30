# frozen_string_literal: true

class CreateResearchSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :research_steps do |t|
      t.bigint :research_id, null: false
      t.integer :step_id, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ResearchStep.create_translation_table! name: :string
      end

      dir.down do
        ResearchStep.drop_translation_table!
      end
    end
  end
end
