module InterviewQuestionsHelper

    def index_view_header
        if @user
            "#{@user.name}'s Interview Questions"
        else
            "All Interview Questions"
        end
    end

    def display_interview_questions
        if @interview_questions.empty? 
            content_tag(:h2, "Looks like you haven't added any interview questions yet. Post a question <a href='/interview_questions/new'>HERE</a>")
        else
             render partial: "questions", locals: {interview_questions: @interview_questions} 
        end
    end

    # def new_question_header
    #     if @interview_question.category
    #       "New Interview Question for #{@interview_question.category.name}"
    #     else
    #      "Add a new Interview Question here:"
    #     end 
    # end

    # def display_categories_and_questions
    #     @interview_questions.each do |category| 
    #         content_tag(:h3, "{category.name}")  if !category.interview_questions.empty? 
    #         category.interview_questions.each do |iq| 
    #            if @user 
    #            tag.h2(link_to "#{iq.question}", interview_question_path(iq)) if iq.user == current_user  
        
    #             else 
    #                 tag.h2(link_to "#{iq.question}", interview_question_path(iq))   
          
    #             end  
    #         end    
        
    #     end 
    # end

end


#render partial: "questions", locals: {interview_questions: @interview_questions} %>


# if @interview_question.category 
# <h1>New Interview Question for:</h1> <br> <h2><%= @interview_question.category.name </h2> 
# else 
# <h1>Add a new Interview Question here:</h1>
# end 

# <h1> <%=current_user.name </h1>

# if @users_questions.empty? 
 
# <h2>Looks like you haven't added any interview questions yet. 
# Post a question <%= link_to "here", new_interview_questions_path </h2>


# <% if @interview_questions.empty? %>
 
# <h2>Looks like you haven't added any interview questions yet. 
# Post a question <%= link_to "here", new_interview_question_path%> </h2>
# <% end %>


# <%= render partial: "questions", locals: {interview_questions: @interview_questions} %>
