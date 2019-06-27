# frozen_string_literal: true

class CreateEvolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :evolutions, &:timestamps
  end
end
