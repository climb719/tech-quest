module InterviewQuestionsHelper

    def index_view_header
        if @user
            "#{@user.name}'s Interview Questions"
        else
            "All Interview Questions"
        end
    end

    def new_question_header
        if @interview_question.category
          "New Interview Question for #{@interview_question.category.name}"
        else
         "Add a new Interview Question here:"
        end 
    end

end


# <% if @interview_question.category %>
# <h1>New Interview Question for:</h1> <br> <h2><%= @interview_question.category.name %></h2> 
# <% else %>
# <h1>Add a new Interview Question here:</h1>
# <% end %>

# <h1> <%=current_user.name%> </h1>

# <% if @users_questions.empty? %>
 
# <h2>Looks like you haven't added any interview questions yet. 
# Post a question <%= link_to "here", new_interview_questions_path%> </h2>

