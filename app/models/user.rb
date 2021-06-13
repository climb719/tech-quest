class User < ApplicationRecord
    has_many :interview_questions
    has_many :comments
    has_many :commented_questions, through: :comments, source: :interview_question
    has_secure_password #gives .authenticate and validations for password, needs bycrpt gem
end
