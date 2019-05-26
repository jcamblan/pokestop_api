class CreateResearchSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :research_steps do |t|

      t.timestamps
    end
  end
end
