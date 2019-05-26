class CreateResearchTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :research_tasks do |t|

      t.timestamps
    end
  end
end
