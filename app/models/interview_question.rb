class InterviewQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :category
  validates :question, :answer, :category, presence: true 
end


#u = User.create(name: "test")
#p = Position.create(title: "Job")
# iq = InterviewQuestion.create(question: "ask", answer: "tell", user: u, position: p)
#iq = InterviewQuestion.create(question: "ask", answer: "tell", user_id: 1, position_id: 1)
#comment = Comment.create(content: "testing", user: u, interview_question: iq)

# add scope method - class level methods that limit the return to be a scope return - return some of the
# questions - most commented, organize, sort by category, some questions only

#scope :by_category, -> { group(:name) }

