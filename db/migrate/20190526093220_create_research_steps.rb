# frozen_string_literal: true

class CreateResearchSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :research_steps, &:timestamps
  end
end
