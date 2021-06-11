#Tech Quest App
    Tech Quest is an app for sharing, studying, and discussing (through comments) interview questions and answers for tech related jobs.

Models

  - User
      - name
      - email
      - password
      - has_many :interview_questions
      - has_many :comments, through: questions

  - Interview_Questions
      - question :string
      - answer :text
      - user_id :integer
      - belongs_to :user
      - belongs_to :position
      - has_many :comments

  - Position:
     - title :string
     - description :string
     - has_many :interview_questions

  - Comments
     - content :text
     - belongs_to :user
     - belongs_to :interview_question 