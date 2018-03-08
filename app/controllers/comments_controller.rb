class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

    def index
      @comments = Comment.all
    end 

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        flash[:success] = "Comment has been added"
      else 
        flash[:danger] = "You can't do this"
      end
      redirect_back(fallback_location: root_path)
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy

      flash[:success] = "Comment deleted" 
      redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
      if current_user
        params.require(:comment).permit!
      end
    end
end