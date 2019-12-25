class HeadProposal < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6} 
    validates :body, presence: true
    has_many :head_comments, dependent: :destroy 
end
