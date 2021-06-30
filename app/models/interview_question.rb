class InterviewQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  #accepts_nested_attributes_for :category
  validates :question, :answer, presence: true 
 # field with errors shows up - form for accepts an object, if excepts an object with an error, it will add div -field with errors
 # but page must be rendered, if redirect, will loose data - also check if content doesn't dissapear
  #belongs to category so have getter and setter for thus has a category for an attribute 
  accepts_nested_attributes_for :category
  #uses category_attributes method that accepts a hash of attributes and when it accepts hash it creates a new category
  #this accepts it from model and params come through right 
  # def category_attributes=(attribute)
  #   self.category = Category.find_or_create_by(attribute) if !attribute[:name].blank?
  # end

 
# add other validations? 
end


#u = User.create(name: "test")
#p = Position.create(title: "Job")
# iq = InterviewQuestion.create(question: "ask", answer: "tell", user: u, position: p)
#iq = InterviewQuestion.create(question: "ask", answer: "tell", user_id: 1, position_id: 1)
#comment = Comment.create(content: "testing", user: u, interview_question: iq)



