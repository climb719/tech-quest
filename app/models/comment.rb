class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :interview_question

  validates :content, presence: true 
end
