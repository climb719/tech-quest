class InterviewQuestionsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @interview_questions = InterviewQuestion.all
    end

    def new
        @interview_question = InterviewQuestion.new
    end

    
end
