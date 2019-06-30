# frozen_string_literal: true

class CreateResearchTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :research_tasks do |t|
      t.bigint :research_step_id
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ResearchTask.create_translation_table! description: :text
      end

      dir.down do
        ResearchTask.drop_translation_table!
      end
    end
  end
end
