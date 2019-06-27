# frozen_string_literal: true

class CreateCandies < ActiveRecord::Migration[6.0]
  def change
    create_table :candies, &:timestamps
  end
end
