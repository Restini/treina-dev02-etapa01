class Job < ApplicationRecord
  validates :title, presence: { message: ' : Não pode ficar em branco' }
  validates :description, presence: { message: ' : Não pode ficar em branco' }
  validates :desired_skill, presence: { message: ' : Não pode ficar em branco' }
  validates :salary_range, presence: { message: ' : Não pode ficar em branco' }
  validates :level, presence: { message: ' : Não pode ficar em branco' }
  validates :deadline, presence: { message: ' : Não pode ficar em branco' }
  validates :region, presence: { message: ' : Não pode ficar em branco' }
  validate :deadline_equal_than_today
  validate :deadline_smaller_than_today

    def deadline_equal_than_today
                
        if deadline == Date.current
          errors.add(:deadline, 'deve ser maior que a data de hoje.')
        end
    end

    def deadline_smaller_than_today
                
      if deadline < Date.current
        errors.add(:deadline, 'deve ser maior que a data de hoje.')
      end
  end

end
 