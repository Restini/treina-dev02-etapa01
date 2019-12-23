class HeadProfile < ApplicationRecord
    validates :name, presence: { message: 'não pode ficar em branco' }
    validates :company, presence: { message: 'não pode ficar em branco' }
end
