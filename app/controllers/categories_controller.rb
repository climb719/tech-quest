class CategoriesController < ApplicationController

    def index
        @categories = Category.alphabetical
    end

    def new
    end
    #     #if nested and we find the category 
    #    if params[:interview_question_id] && @interview_question = InterviewQuestion.find_by_id(params[:category_id])
    #     #instantiate a new question that knows it belongs to a category
    #     @interview_question = @category.interview_questions.build
    # else
    #     @interview_question = InterviewQuestion.new
    # end



    # def create
    # binding.pry
    # # @interview_question = current_user.interview_questions.build(interview_question_params)
    # # #binding.pry
    # # if @interview_question.save
    # #     redirect_to interview_questions_path
    # # else
    # #     render :new
    # end

    def show
        @category = Category.find_by(id: params[:id])
    end

   private

   def category_params
    params.require(:category).permit(:name)
   end


end
