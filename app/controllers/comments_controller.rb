class CommentsController < ApplicationController

    def index
        #if it's nested and can find the question, setting value of @ post and then evaluating if @ post nil or something/true, if true will keep reading the code, if false will skip to else
        if params[:interview_question_id] && @interview_question = InterviewQuestion.find_by_id(params[:interview_question_id])
            @comments = @interview_question.comments
        else
            @error = "That interview question doesn't exist, here are the comments that have been posted:"
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
