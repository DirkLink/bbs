class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]


  def create
    user = User.find(params[:author_id])
    @comment = user.posts.new(
      board_id: params[:board_id],
      post_id: params[:post_id],
      body: params[:body]
      )
    authorize! :create, @comment
    @comment.save
  end
end
