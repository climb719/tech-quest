class InterviewQuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update]
    before_action :redirect_if_not_authorized, only: [:edit, :update]
    
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @interview_questions = @user.categories.by_category 
        else
            @interview_questions = Category.by_category
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @interview_question = @category.interview_questions.build
        else
            @interview_question = InterviewQuestion.new
        end
        @interview_question.build_category
    end

    
    def create
        @interview_question = current_user.interview_questions.build(interview_question_params)
        if @interview_question.save
            redirect_to interview_questions_path
        else
            render :new
        end
    end

    def show
    end

    def edit     
    end

    def update
        if @interview_question.update(interview_question_params)
            redirect_to interview_question_path(@interview_question)
        else
            render :edit
        end
    end

    private

    def interview_question_params
        params.require(:interview_question).permit(:question, :answer, :category_id, category_attributes: [:name])
    end

    def set_question
        @interview_question = InterviewQuestion.find_by(id: params[:id])
        if !@interview_question
            flash[:message] = "Question not found"
            redirect_to interview_questions_path
        end
    end 

    def redirect_if_not_authorized
        redirect_to interview_questions_path if @interview_question.user != current_user
    end

    
end
