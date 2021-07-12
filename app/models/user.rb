class User < ApplicationRecord
    has_many :interview_questions, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commented_questions, through: :comments, source: :interview_question
    has_many :categories, through: :interview_questions, dependent: :destroy
    has_secure_password
    validates :email, uniqueness: true, presence: true
end
