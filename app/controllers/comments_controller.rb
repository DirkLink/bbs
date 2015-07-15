class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]


  def create
    user = User.find(params[:author_id])
    @comment = user.comments.new(
      post_id: params[:post_id],
      body: params[:body]
      )
    authorize! :create, @comment
    if @comment.save
      redirect_to [@comment.post.board, @comment.post, @comment], notice: "Comment created"
    else
      render :new
    end
  end

  def show
    set_comment
    authorize! :read, @comment
  end

  def destroy
    set_comment
    @comment.destroy
    authorize! :destroy, @comment
    redirect_to [@comment.post.board, @comment.post], notice: "Comment created"
  end

  private
    def set_comment
      @comment = Comment.find params[:id]
    end
end
