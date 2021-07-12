module InterviewQuestionsHelper

    def index_view_header
        if @user
            "#{@user.name}'s Interview Questions"
        else
            "All Interview Questions"
        end
    end
end
