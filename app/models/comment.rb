class Comment < ApplicationRecord
  validates :username, presence: { message: 'não pode ficar em branco' }
  validates :body, presence: { message: 'não pode ficar em branco' }
  belongs_to :proposal
end
