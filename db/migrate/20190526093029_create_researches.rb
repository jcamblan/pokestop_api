# frozen_string_literal: true

class CreateResearches < ActiveRecord::Migration[6.0]
  def change
    create_table :researches, &:timestamps
  end
end
