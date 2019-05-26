class CreateEggs < ActiveRecord::Migration[6.0]
  def change
    create_table :eggs do |t|

      t.timestamps
    end
  end
end
