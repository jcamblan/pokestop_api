# frozen_string_literal: true

class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards, &:timestamps
  end
end
