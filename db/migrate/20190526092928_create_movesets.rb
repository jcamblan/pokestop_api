# frozen_string_literal: true

class CreateMovesets < ActiveRecord::Migration[6.0]
  def change
    create_table :movesets, &:timestamps
  end
end
