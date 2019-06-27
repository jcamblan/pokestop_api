# frozen_string_literal: true

class CreateResearchTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :research_tasks, &:timestamps
  end
end
