class ApplicantProfile < ApplicationRecord
    validates :name, presence: { message: 'não pode ficar em branco' }
    validates :social_name, presence: { message: 'não pode ficar em branco' }
    validates :date_of_birth, presence: { message: 'não pode ficar em branco' }
    validates :education, presence: { message: 'não pode ficar em branco' }
    validates :applicant_description, presence: { message: 'não pode ficar em branco' }
    validates :experience, presence: { message: 'não pode ficar em branco' }
    validate :date_of_birth_equal_today        

    def date_of_birth_equal_today
                
        if date_of_birth == Date.current
          errors.add(:date_of_birth, 'deve ser menor que a data de hoje.')
        end
    end

end
  