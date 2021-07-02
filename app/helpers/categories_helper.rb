module CategoriesHelper

    def show_category
         if @category.interview_questions.empty? 
        content_tag(:h3, "Looks like there are no questions in this category yet, add a question below:")
        else 
            render partial: "category_questions"
        end 
     end 
end


# <% if @category.interview_questions.empty? %>
# <h3> Looks like there are no questions in this category yet! </h3>
# <% else %>
# <% @category.interview_questions.each do |iq| %>
#     <li> <%= link_to iq.question, interview_question_path(iq) %> </li>
#     <% end %>
# <% end %>