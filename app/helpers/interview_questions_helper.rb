module InterviewQuestionsHelper

    def index_view_header
        if @user
            "#{@user.name}'s Interview Questions"
        else
            "All Interview Questions"
        end
    end

    
    def display_new_header
        if @category
             content_tag(:h1, "Create a question for #{@category.name}")
        else 
             content_tag(:h1, "Create an Interview Question")
        end 
   end

end
