class CreateApplicantProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_profiles do |t|
      t.string :name
      t.string :social_name
      t.date :date_of_birth
      t.string :education
      t.string :applicant_description
      t.string :experience

      t.timestamps
    end
  end
end
