class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :interview_question

  validates :content, presence: true 


  def display_date
    self.created_at.strftime("%d %b. %Y")
  end
end
