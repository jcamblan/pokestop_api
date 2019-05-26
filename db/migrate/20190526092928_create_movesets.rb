class CreateMovesets < ActiveRecord::Migration[6.0]
  def change
    create_table :movesets do |t|

      t.timestamps
    end
  end
end
