class Job < ApplicationRecord
  validates :title, presence: { message: 'não pode ficar em branco' }
  validates :description, presence: { message: 'não pode ficar em branco' }
  validates :desired_skill, presence: { message: 'não pode ficar em branco' }
  validates :salary_range, presence: { message: 'não pode ficar em branco' }
  validates :level, presence: { message: 'não pode ficar em branco' }
  validates :deadline, presence: { message: 'não pode ficar em branco' }
  validates :region, presence: { message: 'não pode ficar em branco' }
end
 