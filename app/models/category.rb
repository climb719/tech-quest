class Category < ApplicationRecord
    has_many :interview_questions, dependent: :destroy
    validates :name, uniqueness: true
    scope :alphabetical, -> { order(:name) }
    scope :by_category, -> { group(:name) }
end

