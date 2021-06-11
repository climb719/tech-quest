# Tech Quest App
    Tech Quest is an app for sharing, studying, and discussing interview questions and answers for tech related jobs.

## Models  
--no-test-framework

  - User 
      - name
      - email
      - password_digest
      - has_many :interview_questions
      - has_many :comments
      - has_many :commented_questions, through: :interview_ questions
    

  - Interview_Questions  
      - question:string
      - answer:text
      - belongs_to :user
      - belongs_to :position
      - has_many :comments
      - has_many users, through: :comments

  - Position:
     - title:string
     - description:string ??
     - has_many :interview_questions
   

  - Comments - join tabel? Joining users and interview_questions
     - content:text
     - belongs_to :user
     - belongs_to :interview_question 
    