module UsersHelper

    
    def display_users_questions
        if @user.interview_questions.empty? 
            content_tag(:h2, "Looks like you haven't added any interview questions yet. Post a question <a href='/interview_questions/new'>HERE</a>")
        else
            content_tag(:h3, "My Interview Questions")
             render partial: "interview_questions/questions", locals: {interview_questions: @users_questions} 
        end
    end


end
