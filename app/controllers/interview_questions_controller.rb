class InterviewQuestionsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        #check if nested,, if nested will have iq parameter for iq ide
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @interview_questions = @user.categories.by_category 
           #binding.pry
        #@interview_questions = Category.all.group(:name)
        else
            @interview_questions = Category.by_category
        end
    end

    def new
        #if nested and we find the category 
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            #instantiate a new question that knows it belongs to a category
            @interview_question = @category.interview_questions.build
        else
            @interview_question = InterviewQuestion.new
        end
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

    def edit
        @interview_question = InterviewQuestion.find_by_id(params[:id])
        #binding.pry
        redirect_to interview_questions_path if !@interview_question
    end

    def update
        @interview_question = InterviewQuestion.find_by(id: params[:id])
        redirect_to interview_questions_path if !@interview_question
        if @interview_question.update(interview_question_params)
            redirect_to interview_question_path(@interview_question)
        else
            render :edit
        end
    end

    # def destroy

    #     @interview_question = InterviewQuestion.find(params[:id]) 
    #     session[:user_id] = nil
    #     @interview_question.destroy
    #     redirect_to interview_questions_path
    # end
    # <%= link_to "Delete", interview_question_path(@interview_question), flash[:message] => "Are you sure?", :method => :delete %>



    private

    def interview_question_params
        params.require(:interview_question).permit(:question, :answer, :category_id )#catergory_attributes: [:name]
    end

    
end
