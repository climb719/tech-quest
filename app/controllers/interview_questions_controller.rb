class InterviewQuestionsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @interview_questions = InterviewQuestion.all
    end

    def new
        @interview_question = InterviewQuestion.new
    end

    def create
        #binding.pry
        @interview_question = current_user.interview_questions.build(interview_question_params)
        #binding.pry
        if @interview_question.save
            redirect_to interview_questions_path
        else
            render :new
        end
    end

    def show
        @interview_question = InterviewQuestion.find_by(id: params[:id])
    end

    private

    def interview_question_params
        params.require(:interview_question).permit(:question, :answer, :category_id)
    end

    
end
