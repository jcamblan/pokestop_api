class CreateResearches < ActiveRecord::Migration[6.0]
  def change
    create_table :researches do |t|

      t.timestamps
    end
  end
end
