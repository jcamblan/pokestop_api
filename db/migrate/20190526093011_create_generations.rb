# frozen_string_literal: true

class CreateGenerations < ActiveRecord::Migration[6.0]
  def change
    create_table :generations, &:timestamps
  end
end
