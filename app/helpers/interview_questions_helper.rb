module InterviewQuestionsHelper

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

