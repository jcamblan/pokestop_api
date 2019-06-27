# frozen_string_literal: true

class CreateEggs < ActiveRecord::Migration[6.0]
  def change
    create_table :eggs, &:timestamps
  end
end
