class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.string :applicant_name
      t.string :email
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
