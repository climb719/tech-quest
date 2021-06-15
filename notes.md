# Tech Quest App
    Tech Quest is an app for sharing, studying, and discussing tech interview questions and answers for software engineering jobs. 

## Models  
--no-test-framework

  - User 
      - name
      - email
      - password_digest
      - has_many :interview_questions
      - has_many :comments
      - has_many :commented_questions, through: :comments, source: interview_questions
    

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
    
    #xmVJW6mTD9XgEqF
    bob.code@gmail.com
    password

    # Nested Routes
        - #new and #index
        - '/interview_questions/:id/comments'
        - '/categories/:id/interview_questions'
