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
    @comment = comments.find params[:id]
    authorize! :read, @comment
  end
end
