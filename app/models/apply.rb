class Apply < ApplicationRecord
  validates :applicant_name, presence: { message: 'não pode ficar em branco' }
  validates :email, presence: { message: 'não pode ficar em branco' }
  validates :job_id, presence: { message: 'não pode ficar em branco' }
  belongs_to :job
end
