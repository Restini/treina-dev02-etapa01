class Proposal < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6} 
    validates :body, presence: true
    has_many :comments, dependent: :destroy 
end
