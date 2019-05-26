class CreateCandies < ActiveRecord::Migration[6.0]
  def change
    create_table :candies do |t|

      t.timestamps
    end
  end
end
