class ApplicantProfile < ApplicationRecord
    validates :name, presence: { message: 'não pode ficar em branco' }
    validates :social_name, presence: { message: 'não pode ficar em branco' }
    validates :date_of_birth, presence: { message: 'não pode ficar em branco' }
    validates :education, presence: { message: 'não pode ficar em branco' }
    validates :applicant_description, presence: { message: 'não pode ficar em branco' }
    validates :experience, presence: { message: 'não pode ficar em branco' }
end
  