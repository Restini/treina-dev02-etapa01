class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :desired_skill
      t.decimal :salary_range
      t.string :level
      t.date :deadline
      t.string :region

      t.timestamps
    end
  end
end
