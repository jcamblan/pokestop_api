class CreateEvolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :evolutions do |t|

      t.timestamps
    end
  end
end
