class InterviewQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :category
  validates :question, :answer, :category, presence: true 
 # field with errors shows up - form for accepts an object, if excepts an object with an error, it will add div -field with errors
 # but page must be rendered, if redirect, will loose data - also check if content doesn't dissapear
  
# add other validations? 
end


#u = User.create(name: "test")
#p = Position.create(title: "Job")
# iq = InterviewQuestion.create(question: "ask", answer: "tell", user: u, position: p)
#iq = InterviewQuestion.create(question: "ask", answer: "tell", user_id: 1, position_id: 1)
#comment = Comment.create(content: "testing", user: u, interview_question: iq)



