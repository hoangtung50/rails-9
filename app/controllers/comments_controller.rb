class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :reply, :like, :dislike]
  before_action :get_comments, only: [:index, :create, :update, :destroy, :like, :dislike]

  def index
  end
  
  def edit
  end

  def reply
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
  end

  def update
    @comment.update(comment_params)
  end

  def like
    @comment.likes.create(user_id: current_user.id)
  end

  def dislike
    @comment.likes.where(user_id: current_user.id).destroy_all
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_comments
      @comments = Comment.root
    end

    def comment_params
      params.require(:comment).permit(:content, :parent_id, :user_id)
    end
end
