class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update]
    before_action :redirect_if_not_authorized, only: [:edit, :update]


    def index
        if nested_found_and_set
            @comments = @interview_question.comments
        else
            @comments = Comment.all
        end
    end

    def new
        if nested_found_and_set
            @comment = @interview_question.comments.build
        else
            @comment = Comment.new
        end
    end

    def create 
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    def destroy
        @comment =  Comment.find(params[:id]) 
        @comment.destroy
        flash[:message] = "Your comment has been deleted!" 
        redirect_to comments_path 
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :interview_question_id)
    end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment
            flash[:message] = "Comment not found!"
            redirect_to comments_path
        end
    end 

    def redirect_if_not_authorized
        redirect_to comments_path if @comment.user != current_user
    end

    def nested_found_and_set
        params[:interview_question_id] && @interview_question = InterviewQuestion.find_by_id(params[:interview_question_id])
    end

end
