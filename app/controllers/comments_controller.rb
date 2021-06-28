class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_comment, only [:show, :edit, :update]

    def index
        #if it's nested and can find the question, setting value of @ interview question and then evaluating if it's nil or something/true, if true will keep reading the code, if false will skip to else
        if params[:interview_question_id] && @interview_question = InterviewQuestion.find_by_id(params[:interview_question_id])
            @comments = @interview_question.comments
            # how to add error if can't find?
        else
            @comments = Comment.all
        end
    end

    def new
        #if nested and find the question
        if params[:interview_question_id] && @interview_question = InterviewQuestion.find_by_id(params[:interview_question_id])
            #instantiate a new comment that knows it belongs to an intrview question
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
      
        redirect_to comments_path if @comment.user != current_user
    end

    def update
     
        redirect_to comments_path @comment.user != current_user
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

    def find_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment
            flash[:message] = "Comment not found"
            redirect_to comments_path
        end
    end 


end
