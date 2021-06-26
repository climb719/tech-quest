class Category < ApplicationRecord
    has_many :interview_questions

    scope :alphabetical, -> { order(:name) }
end

