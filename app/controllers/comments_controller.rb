class CommentsController < ApplicationController

    def index
        #if comment nested check if interview_question id 
        if params[:interview_question_id] && @interview_question = InterviewQuestion.find_by_id(params[:interview_question_id])
            @comments = @interview_question.comments
        else
        @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new
    end

    def create 
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :interview_question_id)
    end

end
